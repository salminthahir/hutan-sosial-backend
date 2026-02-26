const jwt = require('jsonwebtoken');
const { AdminUsers } = require('../models');

const JWT_SECRET = process.env.JWT_SECRET || 'hutan-sosial-super-secret-key-2026';

const requireAuth = async (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;
        if (!authHeader || !authHeader.startsWith('Bearer ')) {
            return res.status(401).json({ success: false, message: 'Harap sertakan token Bearer untuk otentikasi' });
        }

        const token = authHeader.split(' ')[1];
        const decoded = jwt.verify(token, JWT_SECRET);

        // Fetch user to ensure they still exist and are active
        const user = await AdminUsers.findByPk(decoded.id);
        if (!user || !user.isActive) {
            return res.status(401).json({ success: false, message: 'Sesi anda tidak valid atau akun telah dinonaktifkan' });
        }

        // Attach user to request
        req.adminUser = user;
        next();
    } catch (error) {
        if (error.name === 'TokenExpiredError') {
            return res.status(401).json({ success: false, message: 'Sesi anda telah berakhir, silakan login kembali' });
        }
        return res.status(401).json({ success: false, message: 'Token tidak valid' });
    }
};

const requireRole = (roles) => {
    return (req, res, next) => {
        if (!req.adminUser) {
            return res.status(401).json({ success: false, message: 'Belum terautentikasi' });
        }

        if (!roles.includes(req.adminUser.role)) {
            return res.status(403).json({ success: false, message: 'Anda tidak memiliki akses untuk tindakan ini' });
        }

        next();
    };
};

module.exports = {
    requireAuth,
    requireRole,
    JWT_SECRET // Exported for use in AuthController
};
