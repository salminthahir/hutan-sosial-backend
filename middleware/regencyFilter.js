/**
 * Regency Scope Middleware
 * Otomatis membatasi akses admin berdasarkan kabupaten yang di-assign.
 * - superadmin: akses semua data (tidak ada filter)
 * - admin: hanya data di kabupaten miliknya
 */

const buildRegencyScope = (req) => {
    const user = req.adminUser;
    if (!user) return null;

    // Superadmin: tidak ada filter
    if (user.role === 'superadmin' || !user.regencyId) {
        return null;
    }

    // Admin kabupaten: return regencyId untuk filtering
    return user.regencyId;
};

/**
 * Middleware yang inject regencyScope ke request
 */
const injectRegencyScope = (req, res, next) => {
    req.regencyScope = buildRegencyScope(req);
    next();
};

module.exports = {
    buildRegencyScope,
    injectRegencyScope
};
