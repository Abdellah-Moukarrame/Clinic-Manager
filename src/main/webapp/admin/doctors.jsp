<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Doctors | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style type="text/tailwindcss">
        @layer components {
            .field { @apply w-full border border-slate-200 rounded-xl px-4 py-3 bg-white text-slate-900 text-sm
                     placeholder:text-slate-400 outline-none transition
                     focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10; }
            .label { @apply block text-sm font-semibold text-slate-700 mb-2; }
            .icon-btn { @apply w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:bg-slate-50
                        flex items-center justify-center; }
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-900 antialiased">

<div class="min-h-screen lg:flex">

    <jsp:include page="/admin/sidebar.jsp">
        <jsp:param name="active" value="doctors"/>
    </jsp:include>

    <div class="flex-1 min-w-0">

        <header class="sticky top-0 z-30 bg-white/80 backdrop-blur border-b border-slate-200">
            <div class="flex items-center justify-between px-5 sm:px-8 h-16">
                <button type="button" onclick="toggleSidebar()"
                        class="lg:hidden text-slate-600 hover:text-slate-900" aria-label="Open menu">
                    <i data-lucide="menu" class="w-6 h-6"></i>
                </button>
                <div class="flex items-center gap-3 ml-auto">
                    <span class="hidden sm:inline rounded-full bg-slate-100 text-slate-600 text-xs font-semibold px-3 py-1">Administrator</span>
                    <div class="w-9 h-9 rounded-full bg-teal-600 text-white flex items-center justify-center text-sm font-semibold">A</div>
                </div>
            </div>
        </header>

        <main class="px-5 sm:px-8 py-8 max-w-6xl">

            <section class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4 mb-8">
                <div>
                    <h1 class="text-3xl font-bold">Doctors</h1>
                    <p class="mt-1 text-slate-500">Manage the doctors, their specialty and their department.</p>
                </div>
                <button type="button" onclick="openModal(null)"
                        class="flex items-center justify-center gap-2 bg-teal-600 hover:bg-teal-700 text-white
                               rounded-xl px-5 py-3 font-semibold transition shadow-lg shadow-teal-600/20">
                    <i data-lucide="user-plus" class="w-4 h-4"></i> Add doctor
                </button>
            </section>

            <!-- Filters -->
            <div class="flex flex-col sm:flex-row gap-3 mb-6">
                <div class="relative w-full sm:max-w-md">
                    <i data-lucide="search" class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"></i>
                    <input type="text" id="q" oninput="filterRows()" placeholder="Search by name, matricule or email"
                           class="field pl-12">
                </div>
                <select id="spec" onchange="filterRows()" class="field sm:w-56">
                    <option value="">All specialties</option>
                    <option>Cardiology</option>
                    <option>Dermatology</option>
                    <option>Neurology</option>
                    <option>Pediatrics</option>
                </select>
            </div>

            <!-- Table -->
            <section class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-sm">
                        <thead class="bg-slate-50 text-left text-slate-500">
                        <tr>
                            <th class="px-6 py-4 font-semibold">Doctor</th>
                            <th class="px-6 py-4 font-semibold">Matricule</th>
                            <th class="px-6 py-4 font-semibold">Specialty</th>
                            <th class="px-6 py-4 font-semibold">Contact</th>
                            <th class="px-6 py-4 font-semibold text-right">Actions</th>
                        </tr>
                        </thead>
                        <tbody id="rows" class="divide-y divide-slate-100">

                        <tr data-id="1" data-matricule="MED-001" data-title="Dr." data-first="Sara" data-last="Benali"
                            data-email="sara.benali@clinic.com" data-phone="0612345678"
                            data-specialty="Cardiology" data-department="Medicine">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">SB</span>
                                    <span class="font-semibold">Dr. Sara Benali</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">MED-001</td>
                            <td class="px-6 py-4">
                                <p class="font-medium">Cardiology</p>
                                <p class="text-xs text-slate-500">Medicine</p>
                            </td>
                            <td class="px-6 py-4 text-slate-600">
                                <p>sara.benali@clinic.com</p>
                                <p class="text-xs text-slate-500">0612345678</p>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit">
                                        <i data-lucide="pencil" class="w-4 h-4"></i>
                                    </button>
                                    <button type="button" onclick="confirmDelete(this.closest('tr'))" class="icon-btn hover:text-red-600 hover:bg-red-50" aria-label="Delete">
                                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <tr data-id="2" data-matricule="MED-002" data-title="Dr." data-first="Youssef" data-last="Alaoui"
                            data-email="youssef.alaoui@clinic.com" data-phone="0623456789"
                            data-specialty="Dermatology" data-department="Medicine">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">YA</span>
                                    <span class="font-semibold">Dr. Youssef Alaoui</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">MED-002</td>
                            <td class="px-6 py-4">
                                <p class="font-medium">Dermatology</p>
                                <p class="text-xs text-slate-500">Medicine</p>
                            </td>
                            <td class="px-6 py-4 text-slate-600">
                                <p>youssef.alaoui@clinic.com</p>
                                <p class="text-xs text-slate-500">0623456789</p>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit">
                                        <i data-lucide="pencil" class="w-4 h-4"></i>
                                    </button>
                                    <button type="button" onclick="confirmDelete(this.closest('tr'))" class="icon-btn hover:text-red-600 hover:bg-red-50" aria-label="Delete">
                                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <tr data-id="3" data-matricule="PED-001" data-title="Pr." data-first="Laila" data-last="Mansouri"
                            data-email="laila.mansouri@clinic.com" data-phone="0634567890"
                            data-specialty="Pediatrics" data-department="Pediatrics">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">LM</span>
                                    <span class="font-semibold">Pr. Laila Mansouri</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">PED-001</td>
                            <td class="px-6 py-4">
                                <p class="font-medium">Pediatrics</p>
                                <p class="text-xs text-slate-500">Pediatrics</p>
                            </td>
                            <td class="px-6 py-4 text-slate-600">
                                <p>laila.mansouri@clinic.com</p>
                                <p class="text-xs text-slate-500">0634567890</p>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit">
                                        <i data-lucide="pencil" class="w-4 h-4"></i>
                                    </button>
                                    <button type="button" onclick="confirmDelete(this.closest('tr'))" class="icon-btn hover:text-red-600 hover:bg-red-50" aria-label="Delete">
                                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <p id="empty" class="hidden px-6 py-10 text-center text-slate-400">No doctor matches your search.</p>
            </section>
        </main>
    </div>
</div>

<!-- ===== Add / edit modal ===== -->
<div id="modal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50">
    <div class="w-full max-w-xl max-h-[90vh] overflow-y-auto bg-white rounded-2xl p-6 sm:p-8 shadow-xl">
        <div class="flex items-start justify-between">
            <h2 id="modalTitle" class="text-xl font-bold">Add doctor</h2>
            <button type="button" onclick="closeModal()" class="text-slate-400 hover:text-slate-700" aria-label="Close">
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin/doctors" class="mt-6 space-y-5">
            <input type="hidden" name="action" value="save">
            <input type="hidden" id="f-id" name="id">

            <div class="grid grid-cols-1 sm:grid-cols-3 gap-5">
                <div>
                    <label class="label" for="f-title">Title</label>
                    <select id="f-title" name="title" class="field">
                        <option>Dr.</option>
                        <option>Pr.</option>
                    </select>
                </div>
                <div class="sm:col-span-2">
                    <label class="label" for="f-matricule">Matricule</label>
                    <input id="f-matricule" name="matricule" type="text" required maxlength="20" placeholder="MED-001" class="field">
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="label" for="f-first">First name</label>
                    <input id="f-first" name="firstName" type="text" required placeholder="Sara" class="field">
                </div>
                <div>
                    <label class="label" for="f-last">Last name</label>
                    <input id="f-last" name="lastName" type="text" required placeholder="Benali" class="field">
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="label" for="f-email">Email</label>
                    <input id="f-email" name="email" type="email" required placeholder="doctor@clinic.com" class="field">
                </div>
                <div>
                    <label class="label" for="f-phone">Phone</label>
                    <input id="f-phone" name="phone" type="tel" placeholder="0612345678" class="field">
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="label" for="f-department">Department</label>
                    <select id="f-department" name="departmentId" required class="field">
                        <option value="">Choose...</option>
                        <option>Medicine</option>
                        <option>Surgery</option>
                        <option>Pediatrics</option>
                        <option>Emergency</option>
                    </select>
                </div>
                <div>
                    <label class="label" for="f-specialty">Specialty</label>
                    <select id="f-specialty" name="specialtyId" required class="field">
                        <option value="">Choose...</option>
                        <option>Cardiology</option>
                        <option>Dermatology</option>
                        <option>Neurology</option>
                        <option>Pediatrics</option>
                    </select>
                </div>
            </div>

            <!-- Only when creating: the doctor needs an account to sign in -->
            <div id="pwBlock">
                <label class="label" for="f-password">Temporary password</label>
                <input id="f-password" name="password" type="password" minlength="6" autocomplete="new-password"
                       placeholder="At least 6 characters" class="field">
                <p class="mt-2 text-xs text-slate-400">The doctor signs in with the email above and can change it later.</p>
            </div>

            <div class="flex gap-3 pt-2">
                <button type="button" onclick="closeModal()"
                        class="flex-1 border border-slate-200 hover:bg-slate-50 rounded-xl py-3 font-semibold text-slate-800 transition">
                    Cancel
                </button>
                <button type="submit"
                        class="flex-1 bg-teal-600 hover:bg-teal-700 text-white rounded-xl py-3 font-semibold transition shadow-lg shadow-teal-600/20">
                    Save
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Delete form (submitted after confirmation) -->
<form id="deleteForm" method="post" action="${pageContext.request.contextPath}/admin/doctors" class="hidden">
    <input type="hidden" name="action" value="delete">
    <input type="hidden" id="deleteId" name="id">
</form>

<script>
    lucide.createIcons();

    function openModal(row) {
        var d = row ? row.dataset : {};
        var editing = !!row;
        document.getElementById('modalTitle').textContent = editing ? 'Edit doctor' : 'Add doctor';
        document.getElementById('f-id').value = d.id || '';
        document.getElementById('f-title').value = d.title || 'Dr.';
        document.getElementById('f-matricule').value = d.matricule || '';
        document.getElementById('f-first').value = d.first || '';
        document.getElementById('f-last').value = d.last || '';
        document.getElementById('f-email').value = d.email || '';
        document.getElementById('f-phone').value = d.phone || '';
        document.getElementById('f-department').value = d.department || '';
        document.getElementById('f-specialty').value = d.specialty || '';
        document.getElementById('f-password').value = '';
        document.getElementById('f-password').required = !editing;
        document.getElementById('pwBlock').classList.toggle('hidden', editing);
        document.getElementById('modal').classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('modal').classList.add('hidden');
    }

    function confirmDelete(row) {
        var name = row.dataset.title + ' ' + row.dataset.first + ' ' + row.dataset.last;
        if (confirm('Delete ' + name + '? This cannot be undone.')) {
            document.getElementById('deleteId').value = row.dataset.id;
            document.getElementById('deleteForm').submit();
        }
    }

    function filterRows() {
        var q = document.getElementById('q').value.trim().toLowerCase();
        var spec = document.getElementById('spec').value;
        var visible = 0;
        document.querySelectorAll('#rows tr').forEach(function (row) {
            var d = row.dataset;
            var text = (d.first + ' ' + d.last + ' ' + d.matricule + ' ' + d.email).toLowerCase();
            var show = text.indexOf(q) !== -1 && (!spec || d.specialty === spec);
            row.classList.toggle('hidden', !show);
            if (show) visible++;
        });
        document.getElementById('empty').classList.toggle('hidden', visible !== 0);
    }

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') closeModal();
    });
</script>

</body>
</html>
