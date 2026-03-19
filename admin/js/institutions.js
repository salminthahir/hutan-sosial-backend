let currentPage = 1;

async function loadInstitutions(page = 1, search = '') {
    currentPage = page;
    const bodyEl = document.getElementById('institutions-body');
    const infoEl = document.getElementById('page-info');
    const prevBtn = document.getElementById('prev-page');
    const nextBtn = document.getElementById('next-page');

    if (!bodyEl) return;

    bodyEl.innerHTML = '<tr><td colspan="6" style="text-align: center;">Memuat data...</td></tr>';

    const res = await API.get(`/api/admin/institutions?page=${page}&limit=10&search=${encodeURIComponent(search)}`);

    if (res.success) {
        bodyEl.innerHTML = '';
        const data = res.data;

        if (data.length === 0) {
            bodyEl.innerHTML = '<tr><td colspan="6" style="text-align: center;">Tidak ada data ditemukan.</td></tr>';
        } else {
            data.forEach(i => {
                const tr = document.createElement('tr');
                const badgeClass = i.isActive ? 'badge-success' : 'badge-warning';

                let memberInfo = '-';
                if (i.members && i.members.length > 0) {
                    memberInfo = `${i.members[0].totalMembers} Orang / ${i.members[0].totalHouseholds} KK`;
                }

                tr.innerHTML = `
                    <td><strong>${i.fullName || '-'}</strong></td>
                    <td>${i.shortName || '-'}</td>
                    <td>${i.type?.name || '-'}</td>
                    <td>${memberInfo}</td>
                    <td><span class="badge ${badgeClass}">${i.isActive ? 'Aktif' : 'Non-Aktif'}</span></td>
                    <td style="text-align: right;">
                        <a href="/admin/institutions/form.html?id=${i.id}" class="btn" style="background: rgba(255,255,255,0.1); color: var(--text-main); font-size: 12px; padding: 6px 10px;">Edit</a>
                        <button class="btn btn-danger delete-btn" data-id="${i.id}" style="font-size: 12px; padding: 6px 10px; margin-left: 5px;">Hapus</button>
                    </td>
                `;
                bodyEl.appendChild(tr);
            });

            document.querySelectorAll('.delete-btn').forEach(btn => {
                btn.addEventListener('click', async (e) => {
                    if (confirm('Apakah Anda yakin ingin menghapus lembaga ini?')) {
                        const id = e.target.getAttribute('data-id');
                        const delRes = await API.delete(`/api/admin/institutions/${id}`);
                        if (delRes.success) {
                            alert('Data berhasil dihapus');
                            loadInstitutions(currentPage, document.getElementById('search-input').value);
                        } else {
                            alert('⚠️ ' + (delRes.message || 'Gagal menghapus data'));
                        }
                    }
                });
            });

        }

        // Pagination UI
        infoEl.textContent = `Halaman ${res.meta.page} dari ${res.meta.totalPages || 1} (Total: ${res.meta.total})`;
        prevBtn.disabled = res.meta.page <= 1;
        nextBtn.disabled = res.meta.page >= res.meta.totalPages;

        prevBtn.style.opacity = prevBtn.disabled ? '0.5' : '1';
        nextBtn.style.opacity = nextBtn.disabled ? '0.5' : '1';
    } else {
        bodyEl.innerHTML = `<tr><td colspan="6" style="text-align: center; color: var(--danger);">${res.message}</td></tr>`;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    // List Page Handlers
    if (document.getElementById('institutions-table')) {
        loadInstitutions();

        document.getElementById('search-btn').addEventListener('click', () => {
            const query = document.getElementById('search-input').value;
            loadInstitutions(1, query);
        });

        document.getElementById('search-input').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                loadInstitutions(1, e.target.value);
            }
        });

        document.getElementById('prev-page').addEventListener('click', () => {
            const query = document.getElementById('search-input').value;
            loadInstitutions(currentPage - 1, query);
        });

        document.getElementById('next-page').addEventListener('click', () => {
            const query = document.getElementById('search-input').value;
            loadInstitutions(currentPage + 1, query);
        });
    }

    // Form Page Handlers
    const formEl = document.getElementById('institution-form');
    if (formEl) {
        const urlParams = new URLSearchParams(window.location.search);
        const id = urlParams.get('id');

        // Load reference
        API.get('/api/admin/reference/institution-types').then(res => {
            if (res.success) {
                const select = document.getElementById('typeId');
                res.data.forEach(t => {
                    const opt = document.createElement('option');
                    opt.value = t.id;
                    opt.textContent = t.name;
                    select.appendChild(opt);
                });
            }

            // Load details if editing
            if (id) {
                document.getElementById('form-title').textContent = 'Edit Kelembagaan';
                API.get(`/api/admin/institutions/${id}`).then(detailRes => {
                    if (detailRes.success) {
                        const d = detailRes.data;
                        document.getElementById('fullName').value = d.fullName || '';
                        document.getElementById('shortName').value = d.shortName || '';
                        document.getElementById('typeId').value = d.institutionTypeId || '';
                        document.getElementById('isActive').value = d.isActive ? 'true' : 'false';

                        if (d.members && d.members.length > 0) {
                            document.getElementById('membersCount').value = d.members[0].totalMembers || 0;
                            document.getElementById('householdsCount').value = d.members[0].totalHouseholds || 0;
                        }
                    }
                });
            }
        });

        formEl.addEventListener('submit', async (e) => {
            e.preventDefault();
            const btn = document.getElementById('save-btn');
            const alertBox = document.getElementById('alert-msg');
            btn.disabled = true;
            btn.textContent = 'Menyimpan...';
            alertBox.classList.add('hidden');

            const payload = {
                fullName: document.getElementById('fullName').value,
                shortName: document.getElementById('shortName').value,
                typeId: parseInt(document.getElementById('typeId').value) || null,
                isActive: document.getElementById('isActive').value === 'true',
                membersCount: parseInt(document.getElementById('membersCount').value) || 0,
                householdsCount: parseInt(document.getElementById('householdsCount').value) || 0
            };

            let saveRes;
            if (id) {
                saveRes = await API.put(`/api/admin/institutions/${id}`, payload);
            } else {
                saveRes = await API.post('/api/admin/institutions', payload);
            }

            btn.disabled = false;
            btn.textContent = 'Simpan Data Kelembagaan';

            if (saveRes.success) {
                alertBox.className = 'alert badge-success';
                alertBox.textContent = saveRes.message;
                alertBox.classList.remove('hidden');

                if (!id) {
                    // Redirect back to list on successful creation
                    setTimeout(() => window.location.href = '/admin/institutions/list.html', 1500);
                }
            } else {
                alertBox.className = 'alert alert-error';
                alertBox.textContent = saveRes.message || 'Gagal menyimpan data';
                alertBox.classList.remove('hidden');
            }
        });
    }
});
