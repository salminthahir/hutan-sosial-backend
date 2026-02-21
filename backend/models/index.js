'use strict';

const fs = require('fs');
const path = require('path');
const Sequelize = require('sequelize');
const process = require('process');
const env = process.env.NODE_ENV || 'development';
const config = require(__dirname + '/../config/config.js')[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
    sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
    sequelize = new Sequelize(config.database, config.username, config.password, config);
}

// Custom Model Loading
// We group models in files, so we manually import them

// 1. Wilayah & Lembaga
const regionModels = require('./Region')(sequelize, Sequelize.DataTypes);
const institutionModels = require('./Institution')(sequelize, Sequelize.DataTypes);

// 2. Izin & Komoditas Dasar
const permitModels = require('./Permit')(sequelize, Sequelize.DataTypes);
const commodityModels = require('./Commodity')(sequelize, Sequelize.DataTypes);

// 3. Modul Lanjutan (Advanced Modules)
const biophysicalModels = require('./Biophysical')(sequelize, Sequelize.DataTypes);
const derivedProductModels = require('./DerivedProduct')(sequelize, Sequelize.DataTypes);
const socialModels = require('./Social')(sequelize, Sequelize.DataTypes);
const marketModels = require('./Market')(sequelize, Sequelize.DataTypes);
const riskModels = require('./Risk')(sequelize, Sequelize.DataTypes);
const priorityModels = require('./Priority')(sequelize, Sequelize.DataTypes);

// Combine all models
const allModels = {
    ...regionModels,
    ...institutionModels,
    ...permitModels,
    ...commodityModels,
    ...biophysicalModels,
    ...derivedProductModels,
    ...socialModels,
    ...marketModels,
    ...riskModels,
    ...priorityModels
};

// Add to db object
Object.keys(allModels).forEach(modelName => {
    db[modelName] = allModels[modelName];
});

// Run associate if exists
Object.keys(db).forEach(modelName => {
    if (db[modelName].associate) {
        db[modelName].associate(db);
    }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
