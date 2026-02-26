const express = require('express');
const router = express.Router();

const AuthController = require('../controllers/AuthController');
const DashboardController = require('../controllers/admin/DashboardController');
const PermitAdminController = require('../controllers/admin/PermitAdminController');
const InstitutionAdminController = require('../controllers/admin/InstitutionAdminController');
const ReferenceAdminController = require('../controllers/admin/ReferenceAdminController');
const { requireAuth } = require('../middleware/authMiddleware');

// ==========================================
// 1. Authentication Routes
// ==========================================
router.post('/auth/login', AuthController.login);
router.post('/auth/logout', AuthController.logout);
router.get('/auth/me', requireAuth, AuthController.me);

// ==========================================
// 2. Dashboard Stats
// ==========================================
router.get('/dashboard', requireAuth, DashboardController.getStats);

// ==========================================
// 3. Permits CRUD 
// ==========================================
router.get('/permits', requireAuth, PermitAdminController.list);
router.get('/permits/:id', requireAuth, PermitAdminController.get);
router.post('/permits', requireAuth, PermitAdminController.create);
router.put('/permits/:id', requireAuth, PermitAdminController.update);
router.delete('/permits/:id', requireAuth, PermitAdminController.remove);
router.put('/permits/:id/boundary', requireAuth, PermitAdminController.updateBoundary);

// ==========================================
// 4. Institutions CRUD
// ==========================================
router.get('/institutions', requireAuth, InstitutionAdminController.list);
router.get('/institutions/:id', requireAuth, InstitutionAdminController.get);
router.post('/institutions', requireAuth, InstitutionAdminController.create);
router.put('/institutions/:id', requireAuth, InstitutionAdminController.update);
router.delete('/institutions/:id', requireAuth, InstitutionAdminController.remove);

// ==========================================
// 5. Reference Data (Dropdowns)
// ==========================================
router.get('/reference/villages', requireAuth, ReferenceAdminController.getVillages);
router.get('/reference/schemes', requireAuth, ReferenceAdminController.getSchemes);
router.get('/reference/commodities', requireAuth, ReferenceAdminController.getCommodities);
router.get('/reference/forest-statuses', requireAuth, ReferenceAdminController.getForestStatuses);
router.get('/reference/institution-types', requireAuth, ReferenceAdminController.getInstitutionTypes);

module.exports = router;
