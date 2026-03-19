document.addEventListener('DOMContentLoaded', async () => {
    // Redirect to login if no token
    if (!API.getToken()) {
        window.location.href = '/admin/';
        return;
    }

    // Validate token and get user info
    const res = await API.get('/api/admin/auth/me');

    if (res.success && res.data) {
        // Setup user info in UI if elements exist
        const usernameEl = document.getElementById('auth-username');
        const roleEl = document.getElementById('auth-role');

        if (usernameEl) usernameEl.textContent = res.data.username;
        if (roleEl) roleEl.textContent = res.data.role.toUpperCase();

        // Setup Logout Button
        const logoutBtn = document.getElementById('logout-btn');
        if (logoutBtn) {
            logoutBtn.addEventListener('click', async (e) => {
                e.preventDefault();
                await API.post('/api/admin/auth/logout');
                API.removeToken();
                window.location.href = '/admin/';
            });
        }
    } else {
        // Invalid session
        API.removeToken();
        window.location.href = '/admin/';
    }
});
