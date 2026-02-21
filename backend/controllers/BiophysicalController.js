const {
    BiophysicalProfiles,
    PermitLandCovers,
    LandCoverTypes,
    CommoditySuitabilities,
    Commodities
} = require('../models');

exports.getBiophysicalData = async (req, res) => {
    try {
        const { permitId } = req.params;

        const profile = await BiophysicalProfiles.findOne({ where: { permitId } });

        const landCovers = await PermitLandCovers.findAll({
            where: { permitId },
            include: [{ model: LandCoverTypes, as: 'type' }]
        });

        const suitabilities = await CommoditySuitabilities.findAll({
            where: { permitId },
            include: [{ model: Commodities, as: 'commodity' }]
        });

        res.json({
            profile,
            landCovers,
            suitabilities
        });
    } catch (error) {
        console.error('Error fetching biophysical data:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
};
