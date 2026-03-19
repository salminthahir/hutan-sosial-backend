const API = {
    getToken() {
        return localStorage.getItem('hk_admin_token');
    },

    setToken(token) {
        localStorage.setItem('hk_admin_token', token);
    },

    removeToken() {
        localStorage.removeItem('hk_admin_token');
    },

    async request(url, method = 'GET', body = null) {
        const headers = {
            'Content-Type': 'application/json'
        };

        const token = this.getToken();
        if (token) {
            headers['Authorization'] = `Bearer ${token}`;
        }

        const config = {
            method,
            headers
        };

        if (body) {
            config.body = JSON.stringify(body);
        }

        try {
            const response = await fetch(url, config);

            // Handle Unauthorized
            if (response.status === 401 && window.location.pathname !== '/admin/' && window.location.pathname !== '/admin/index.html') {
                this.removeToken();
                window.location.href = '/admin/';
                return { success: false, message: 'Session expired' };
            }

            return await response.json();
        } catch (error) {
            console.error('API Error:', error);
            return {
                success: false,
                message: 'Internal Application Error. Unable to connect to server.'
            };
        }
    },

    get(url) {
        return this.request(url, 'GET');
    },

    post(url, body) {
        return this.request(url, 'POST', body);
    },

    put(url, body) {
        return this.request(url, 'PUT', body);
    },

    delete(url) {
        return this.request(url, 'DELETE');
    }
};
