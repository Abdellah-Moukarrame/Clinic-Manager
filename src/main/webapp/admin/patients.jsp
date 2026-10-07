<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Patients | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
    <style type="text/tailwindcss">
        @layer components {
            .field { @apply w-full border border-slate-200 rounded-xl px-4 py-3 bg-white text-slate-900 text-sm
                     placeholder:text-slate-400 outline-none transition
                     focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10
                     read-only:bg-slate-50 read-only:text-slate-500; }
            .label { @apply block text-sm font-semibold text-slate-700 mb-2; }
            .icon-btn { @apply w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:bg-slate-50
                        flex items-center justify-center; }
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-900 antialiased">

<div class="min-h-screen lg:flex">

    <jsp:include page="/admin/sidebar.jsp">
        <jsp:param name="active" value="patients"/>
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

            <section class="mb-8">
                <h1 class="text-3xl font-bold">Patients</h1>
                <p class="mt-1 text-slate-500">Patients register themselves. Here you can edit their details or disable their account.</p>
            </section>

            <div class="flex flex-col sm:flex-row gap-3 mb-6">
                <div class="relative w-full sm:max-w-md">
                    <i data-lucide="search" class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"></i>
                    <input type="text" id="q" oninput="filterRows()" placeholder="Search by name, CIN or email" class="field pl-12">
                </div>
                <select id="status" onchange="filterRows()" class="field sm:w-48">
                    <option value="">All statuses</option>
                    <option value="active">Active</option>
                    <option value="disabled">Disabled</option>
                </select>
            </div>

            <section class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-sm">
                        <thead class="bg-slate-50 text-left text-slate-500">
                        <tr>
                            <th class="px-6 py-4 font-semibold">Patient</th>
                            <th class="px-6 py-4 font-semibold">CIN</th>
                            <th class="px-6 py-4 font-semibold">Contact</th>
                            <th class="px-6 py-4 font-semibold">Status</th>
                            <th class="px-6 py-4 font-semibold text-right">Actions</th>
                        </tr>
                        </thead>
                        <tbody id="rows" class="divide-y divide-slate-100">

                        <tr data-id="1" data-status="active" data-cin="AB123456" data-email="amine@example.com"
                            data-first="Amine" data-last="Karimi" data-phone="0611111111"
                            data-birth="1995-04-12" data-gender="MALE" data-address="12 Rue Atlas, Marrakesh" data-blood="O+">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">AK</span>
                                    <span class="font-semibold">Amine Karimi</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">AB123456</td>
                            <td class="px-6 py-4 text-slate-600">
                                <p>amine@example.com</p>
                                <p class="text-xs text-slate-500">0611111111</p>
                            </td>
                            <td class="px-6 py-4"><span class="rounded-full bg-teal-50 text-teal-700 text-xs font-semibold px-3 py-1">Active</span></td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit"><i data-lucide="pencil" class="w-4 h-4"></i></button>
                                    <button type="button" onclick="toggleStatus(this.closest('tr'))" class="icon-btn hover:text-amber-600 hover:bg-amber-50" aria-label="Disable account"><i data-lucide="user-x" class="w-4 h-4"></i></button>
                                </div>
                            </td>
                        </tr>

                        <tr data-id="2" data-status="active" data-cin="CD789012" data-email="hajar@example.com"
                            data-first="Hajar" data-last="Bennani" data-phone="0622222222"
                            data-birth="1990-09-30" data-gender="FEMALE" data-address="5 Avenue Hassan II, Marrakesh" data-blood="A+">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">HB</span>
                                    <span class="font-semibold">Hajar Bennani</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">CD789012</td>
                            <td class="px-6 py-4 text-slate-600">
                                <p>hajar@example.com</p>
                                <p class="text-xs text-slate-500">0622222222</p>
                            </td>
                            <td class="px-6 py-4"><span class="rounded-full bg-teal-50 text-teal-700 text-xs font-semibold px-3 py-1">Active</span></td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit"><i data-lucide="pencil" class="w-4 h-4"></i></button>
                                    <button type="button" onclick="toggleStatus(this.closest('tr'))" class="icon-btn hover:text-amber-600 hover:bg-amber-50" aria-label="Disable account"><i data-lucide="user-x" class="w-4 h-4"></i></button>
                                </div>
                            </td>
                        </tr>

                        <tr data-id="3" data-status="disabled" data-cin="EF345678" data-email="omar@example.com"
                            data-first="Omar" data-last="Tazi" data-phone="0633333333"
                            data-birth="1988-01-21" data-gender="MALE" data-address="" data-blood="B-">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">OT</span>
                                    <span class="font-semibold">Omar Tazi</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">EF345678</td>
                            <td class="px-6 py-4 text-slate-600">
                                <p>omar@example.com</p>
                                <p class="text-xs text-slate-500">0633333333</p>
                            </td>
                            <td class="px-6 py-4"><span class="rounded-full bg-amber-50 text-amber-700 text-xs font-semibold px-3 py-1">Disabled</span></td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit"><i data-lucide="pencil" class="w-4 h-4"></i></button>
                                    <button type="button" onclick="toggleStatus(this.closest('tr'))" class="icon-btn hover:text-teal-600 hover:bg-teal-50" aria-label="Enable account"><i data-lucide="user-check" class="w-4 h-4"></i></button>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <p id="empty" class="hidden px-6 py-10 text-center text-slate-400">No patient matches your search.</p>
            </section>
        </main>
    </div>
</div>

<!-- Edit modal (no "add": patients create their own account) -->
<div id="modal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50">
    <div class="w-full max-w-xl max-h-[90vh] overflow-y-auto bg-white rounded-2xl p-6 sm:p-8 shadow-xl">
        <div class="flex items-start justify-between">
            <h2 class="text-xl font-bold">Edit patient</h2>
            <button type="button" onclick="closeModal()" class="text-slate-400 hover:text-slate-700" aria-label="Close">
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin/patients" class="mt-6 space-y-5">
            <input type="hidden" name="action" value="update">
            <input type="hidden" id="f-id" name="id">

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="label" for="f-cin">CIN</label>
                    <input id="f-cin" type="text" readonly class="field">
                </div>
                <div>
                    <label class="label" for="f-email">Email</label>
                    <input id="f-email" type="email" readonly class="field">
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="label" for="f-first">First name</label>
                    <input id="f-first" name="firstName" type="text" required class="field">
                </div>
                <div>
                    <label class="label" for="f-last">Last name</label>
                    <input id="f-last" name="lastName" type="text" required class="field">
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="label" for="f-phone">Phone</label>
                    <input id="f-phone" name="phone" type="tel" class="field">
                </div>
                <div>
                    <label class="label" for="f-birth">Birth date</label>
                    <input id="f-birth" name="birthDate" type="date" class="field">
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <div>
                    <label class="label" for="f-gender">Gender</label>
                    <select id="f-gender" name="gender" class="field">
                        <option value="">Not set</option>
                        <option value="MALE">Male</option>
                        <option value="FEMALE">Female</option>
                    </select>
                </div>
                <div>
                    <label class="label" for="f-blood">Blood group</label>
                    <select id="f-blood" name="bloodGroup" class="field">
                        <option value="">Not set</option>
                        <option>A+</option><option>A-</option>
                        <option>B+</option><option>B-</option>
                        <option>AB+</option><option>AB-</option>
                        <option>O+</option><option>O-</option>
                    </select>
                </div>
            </div>

            <div>
                <label class="label" for="f-address">Address</label>
                <input id="f-address" name="address" type="text" class="field">
            </div>

            <div class="flex gap-3 pt-2">
                <button type="button" onclick="closeModal()"
                        class="flex-1 border border-slate-200 hover:bg-slate-50 rounded-xl py-3 font-semibold text-slate-800 transition">Cancel</button>
                <button type="submit"
                        class="flex-1 bg-teal-600 hover:bg-teal-700 text-white rounded-xl py-3 font-semibold transition shadow-lg shadow-teal-600/20">Save</button>
            </div>
        </form>
    </div>
</div>

<!-- Enable / disable form -->
<form id="toggleForm" method="post" action="${pageContext.request.contextPath}/admin/patients" class="hidden">
    <input type="hidden" name="action" value="setActive">
    <input type="hidden" id="toggleId" name="id">
    <input type="hidden" id="toggleActive" name="active">
</form>

<script>
    lucide.createIcons();

    function openModal(row) {
        var d = row.dataset;
        document.getElementById('f-id').value = d.id;
        document.getElementById('f-cin').value = d.cin;
        document.getElementById('f-email').value = d.email;
        document.getElementById('f-first').value = d.first;
        document.getElementById('f-last').value = d.last;
        document.getElementById('f-phone').value = d.phone;
        document.getElementById('f-birth').value = d.birth;
        document.getElementById('f-gender').value = d.gender;
        document.getElementById('f-blood').value = d.blood;
        document.getElementById('f-address').value = d.address;
        document.getElementById('modal').classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('modal').classList.add('hidden');
    }

    function toggleStatus(row) {
        var enabling = row.dataset.status === 'disabled';
        var name = row.dataset.first + ' ' + row.dataset.last;
        var msg = enabling ? 'Enable the account of ' + name + '?'
                           : 'Disable the account of ' + name + '? They will no longer be able to sign in.';
        if (confirm(msg)) {
            document.getElementById('toggleId').value = row.dataset.id;
            document.getElementById('toggleActive').value = enabling ? 'true' : 'false';
            document.getElementById('toggleForm').submit();
        }
    }

    function filterRows() {
        var q = document.getElementById('q').value.trim().toLowerCase();
        var status = document.getElementById('status').value;
        var visible = 0;
        document.querySelectorAll('#rows tr').forEach(function (row) {
            var d = row.dataset;
            var text = (d.first + ' ' + d.last + ' ' + d.cin + ' ' + d.email).toLowerCase();
            var show = text.indexOf(q) !== -1 && (!status || d.status === status);
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
