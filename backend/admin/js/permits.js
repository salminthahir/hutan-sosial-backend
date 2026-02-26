let currentPage = 1;

async function loadPermits(page = 1, search = '') {
    currentPage = page;
    const bodyEl = document.getElementById('permits-body');
    const infoEl = document.getElementById('page-info');
    const prevBtn = document.getElementById('prev-page');
    const nextBtn = document.getElementById('next-page');

    if (!bodyEl) return; // Not on the list page

    bodyEl.innerHTML = '<tr><td colspan="6" style="text-align: center;">Memuat data...</td></tr>';

    // Fetch data
    const res = await API.get(`/api/admin/permits?page=${page}&limit=10&search=${encodeURIComponent(search)}`);

    if (res.success) {
        bodyEl.innerHTML = '';
        const data = res.data;

        if (data.length === 0) {
            bodyEl.innerHTML = '<tr><td colspan="6" style="text-align: center;">Tidak ada data ditemukan.</td></tr>';
        } else {
            data.forEach(p => {
                const tr = document.createElement('tr');

                const badgeClass = p.permitStatus === 'Izin' ? 'badge-success' : 'badge-warning';

                tr.innerHTML = `
                    <td>
                        <strong>${p.permitNumber || '-'}</strong><br>
                        <small style="color: var(--text-muted)">Tahun: ${p.permitYear || '-'}</small>
                    </td>
                    <td>${p.institution?.fullName || p.institution?.shortName || '-'}</td>
                    <td>
                        Desa ${p.village?.name || '-'}<br>
                        <small style="color: var(--text-muted)">Kab. ${p.village?.district?.regency?.name || '-'}</small>
                    </td>
                    <td>${p.scheme?.name || '-'}</td>
                    <td><span class="badge ${badgeClass}">${p.permitStatus || '-'}</span></td>
                    <td style="text-align: right;">
                        <a href="/admin/permits/form.html?id=${p.id}" class="btn" style="background: rgba(255,255,255,0.1); color: var(--text-main); font-size: 12px; padding: 6px 10px;">Edit</a>
                        <button class="btn btn-danger delete-btn" data-id="${p.id}" style="font-size: 12px; padding: 6px 10px; margin-left: 5px;">Hapus</button>
                    </td>
                `;
                bodyEl.appendChild(tr);
            });

            // Attach delete listeners
            document.querySelectorAll('.delete-btn').forEach(btn => {
                btn.addEventListener('click', async (e) => {
                    if (confirm('Apakah Anda yakin ingin menghapus izin ini?')) {
                        const id = e.target.getAttribute('data-id');
                        const delRes = await API.delete(`/api/admin/permits/${id}`);
                        if (delRes.success) {
                            alert('Data berhasil dihapus');
                            loadPermits(currentPage, document.getElementById('search-input').value);
                        } else {
                            alert(delRes.message || 'Gagal menghapus data');
                        }
                    }
                });
            });
        }

        // Pagination UI
        infoEl.textContent = `Halaman ${res.meta.page} dari ${res.meta.totalPages || 1} (Total: ${res.meta.total})`;
        prevBtn.disabled = res.meta.page <= 1;
        nextBtn.disabled = res.meta.page >= res.meta.totalPages;

        // Ensure styling matches disabled state
        prevBtn.style.opacity = prevBtn.disabled ? '0.5' : '1';
        nextBtn.style.opacity = nextBtn.disabled ? '0.5' : '1';
    } else {
        bodyEl.innerHTML = `<tr><td colspan="6" style="text-align: center; color: var(--danger);">${res.message}</td></tr>`;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    // Check if we are on the list page
    if (document.getElementById('permits-table')) {
        loadPermits();

        document.getElementById('search-btn').addEventListener('click', () => {
            const query = document.getElementById('search-input').value;
            loadPermits(1, query);
        });

        document.getElementById('search-input').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                loadPermits(1, e.target.value);
            }
        });

        document.getElementById('prev-page').addEventListener('click', () => {
            const query = document.getElementById('search-input').value;
            loadPermits(currentPage - 1, query);
        });

        document.getElementById('next-page').addEventListener('click', () => {
            const query = document.getElementById('search-input').value;
            loadPermits(currentPage + 1, query);
        });
    }
});
