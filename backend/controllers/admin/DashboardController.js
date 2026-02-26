const { SocialForestPermits, InstitutionMembers, Institutions } = require('../../models');

const DashboardController = {
    async getStats(req, res) {
        try {
            // Get total permits
            const totalPermits = await SocialForestPermits.count();

            // Get total institutions
            const totalInstitutions = await Institutions.count();

            // Get total area
            const areaSum = await SocialForestPermits.sum('areaPermitted');

            // Get total KK and Members
            const totalHouseholds = await InstitutionMembers.sum('totalHouseholds');
            const totalMembers = await InstitutionMembers.sum('totalMembers');

            res.json({
                success: true,
                data: {
                    totalPermits,
                    totalInstitutions,
                    totalArea: areaSum || 0,
                    totalHouseholds: totalHouseholds || 0,
                    totalMembers: totalMembers || 0
                }
            });
        } catch (error) {
            console.error('Error fetching dashboard stats:', error);
            res.status(500).json({ success: false, message: 'Server error' });
        }
    }
};

module.exports = DashboardController;
