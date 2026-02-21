require('dotenv').config();
require('pg'); // Explicitly require pg so Vercel's @vercel/node compiler includes it
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const { Sequelize } = require('sequelize');
const config = require('./config/config.js')[process.env.NODE_ENV || 'development'];

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(helmet());
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Database Connection
let db;
let sequelize;
let bootError = null;

try {
    db = require('./models');
    sequelize = db.sequelize;
} catch (err) {
    console.error('Boot error initializing database models:', err);
    bootError = err;
}

// Health Check
app.get('/health', async (req, res) => {
    if (bootError) {
        return res.status(500).json({
            status: 'error',
            database: 'failed_to_initialize',
            error: bootError.message,
            stack: bootError.stack
        });
    }

    try {
        await sequelize.authenticate();
        res.json({
            status: 'ok',
            database: 'connected',
            timestamp: new Date().toISOString(),
        });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            database: 'disconnected',
            error: error.message,
        });
    }
});

// Debug
app.get('/version', (req, res) => {
    res.json({ version: 'commit-52b31f5' });
});

// Routes
// Routes
const publicRoutes = require('./routes/publicRoutes');
const advancedRoutes = require('./routes/advancedRoutes');

app.use('/api/public', publicRoutes);
app.use('/api/advanced', advancedRoutes);

// Start Server
if (process.env.NODE_ENV !== 'production' && !process.env.VERCEL) {
    app.listen(PORT, async () => {
        console.log(`Server running on port ${PORT}`);
        try {
            await sequelize.authenticate();
            console.log('Database connection established successfully.');
        } catch (error) {
            console.error('Unable to connect to the database:', error);
        }
    });
}

module.exports = app;
