const express = require('express');
const router = express.Router();

const AuthController = require('../controllers/AuthController');
const DashboardController = require('../controllers/admin/DashboardController');
const PermitAdminController = require('../controllers/admin/PermitAdminController');
const InstitutionAdminController = require('../controllers/admin/InstitutionAdminController');
const ReferenceAdminController = require('../controllers/admin/ReferenceAdminController');
const UserAdminController = require('../controllers/admin/UserAdminController');
const { requireAuth, requireRole } = require('../middleware/authMiddleware');
const { injectRegencyScope } = require('../middleware/regencyFilter');

// ==========================================
// 1. Authentication Routes
// ==========================================
router.post('/auth/login', AuthController.login);
router.post('/auth/logout', AuthController.logout);
router.get('/auth/me', requireAuth, AuthController.me);

// ==========================================
// 2. Dashboard Stats (scoped per kabupaten)
// ==========================================
router.get('/dashboard', requireAuth, injectRegencyScope, DashboardController.getStats);

// ==========================================
// 3. Permits CRUD (scoped per kabupaten)
// ==========================================
router.get('/permits', requireAuth, injectRegencyScope, PermitAdminController.list);
router.get('/permits/:id', requireAuth, injectRegencyScope, PermitAdminController.get);
router.post('/permits', requireAuth, injectRegencyScope, PermitAdminController.create);
router.put('/permits/:id', requireAuth, injectRegencyScope, PermitAdminController.update);
router.delete('/permits/:id', requireAuth, injectRegencyScope, PermitAdminController.remove);
router.put('/permits/:id/boundary', requireAuth, injectRegencyScope, PermitAdminController.updateBoundary);

// ==========================================
// 4. Institutions CRUD (scoped per kabupaten)
// ==========================================
router.get('/institutions', requireAuth, injectRegencyScope, InstitutionAdminController.list);
router.get('/institutions/:id', requireAuth, injectRegencyScope, InstitutionAdminController.get);
router.post('/institutions', requireAuth, injectRegencyScope, InstitutionAdminController.create);
router.put('/institutions/:id', requireAuth, injectRegencyScope, InstitutionAdminController.update);
router.delete('/institutions/:id', requireAuth, injectRegencyScope, InstitutionAdminController.remove);

// ==========================================
// 5. Reference Data (Dropdowns)
// ==========================================
router.get('/reference/villages', requireAuth, injectRegencyScope, ReferenceAdminController.getVillages);
router.get('/reference/schemes', requireAuth, ReferenceAdminController.getSchemes);
router.get('/reference/commodities', requireAuth, ReferenceAdminController.getCommodities);
router.get('/reference/forest-statuses', requireAuth, ReferenceAdminController.getForestStatuses);
router.get('/reference/institution-types', requireAuth, ReferenceAdminController.getInstitutionTypes);
router.get('/reference/regencies', requireAuth, ReferenceAdminController.getRegencies);

// ==========================================
// 6. User Management (superadmin only)
// ==========================================
router.get('/users', requireAuth, requireRole(['superadmin']), UserAdminController.list);
router.get('/users/:id', requireAuth, requireRole(['superadmin']), UserAdminController.get);
router.post('/users', requireAuth, requireRole(['superadmin']), UserAdminController.create);
router.put('/users/:id', requireAuth, requireRole(['superadmin']), UserAdminController.update);
router.delete('/users/:id', requireAuth, requireRole(['superadmin']), UserAdminController.remove);

module.exports = router;
