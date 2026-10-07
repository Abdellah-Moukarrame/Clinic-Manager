<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Specialties | ClinicManager</title>
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
        <jsp:param name="active" value="specialties"/>
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
                    <h1 class="text-3xl font-bold">Specialties</h1>
                    <p class="mt-1 text-slate-500">Each specialty belongs to one department.</p>
                </div>
                <button type="button" onclick="openModal(null)"
                        class="flex items-center justify-center gap-2 bg-teal-600 hover:bg-teal-700 text-white
                               rounded-xl px-5 py-3 font-semibold transition shadow-lg shadow-teal-600/20">
                    <i data-lucide="plus" class="w-4 h-4"></i> Add specialty
                </button>
            </section>

            <div class="flex flex-col sm:flex-row gap-3 mb-6">
                <div class="relative w-full sm:max-w-md">
                    <i data-lucide="search" class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"></i>
                    <input type="text" id="q" oninput="filterRows()" placeholder="Search a specialty" class="field pl-12">
                </div>
                <select id="dept" onchange="filterRows()" class="field sm:w-56">
                    <option value="">All departments</option>
                    <option>Medicine</option>
                    <option>Surgery</option>
                    <option>Pediatrics</option>
                    <option>Emergency</option>
                </select>
            </div>

            <section class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-sm">
                        <thead class="bg-slate-50 text-left text-slate-500">
                        <tr>
                            <th class="px-6 py-4 font-semibold">Specialty</th>
                            <th class="px-6 py-4 font-semibold">Department</th>
                            <th class="px-6 py-4 font-semibold">Doctors</th>
                            <th class="px-6 py-4 font-semibold text-right">Actions</th>
                        </tr>
                        </thead>
                        <tbody id="rows" class="divide-y divide-slate-100">

                        <tr data-id="1" data-name="Cardiology" data-department="Medicine">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center"><i data-lucide="heart-pulse" class="w-5 h-5"></i></span>
                                    <span class="font-semibold">Cardiology</span>
                                </div>
                            </td>
                            <td class="px-6 py-4"><span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Medicine</span></td>
                            <td class="px-6 py-4 text-slate-600">3</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit"><i data-lucide="pencil" class="w-4 h-4"></i></button>
                                    <button type="button" onclick="confirmDelete(this.closest('tr'))" class="icon-btn hover:text-red-600 hover:bg-red-50" aria-label="Delete"><i data-lucide="trash-2" class="w-4 h-4"></i></button>
                                </div>
                            </td>
                        </tr>

                        <tr data-id="2" data-name="Dermatology" data-department="Medicine">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center"><i data-lucide="heart-pulse" class="w-5 h-5"></i></span>
                                    <span class="font-semibold">Dermatology</span>
                                </div>
                            </td>
                            <td class="px-6 py-4"><span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Medicine</span></td>
                            <td class="px-6 py-4 text-slate-600">2</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit"><i data-lucide="pencil" class="w-4 h-4"></i></button>
                                    <button type="button" onclick="confirmDelete(this.closest('tr'))" class="icon-btn hover:text-red-600 hover:bg-red-50" aria-label="Delete"><i data-lucide="trash-2" class="w-4 h-4"></i></button>
                                </div>
                            </td>
                        </tr>

                        <tr data-id="3" data-name="Neurology" data-department="Medicine">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center"><i data-lucide="heart-pulse" class="w-5 h-5"></i></span>
                                    <span class="font-semibold">Neurology</span>
                                </div>
                            </td>
                            <td class="px-6 py-4"><span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Medicine</span></td>
                            <td class="px-6 py-4 text-slate-600">2</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit"><i data-lucide="pencil" class="w-4 h-4"></i></button>
                                    <button type="button" onclick="confirmDelete(this.closest('tr'))" class="icon-btn hover:text-red-600 hover:bg-red-50" aria-label="Delete"><i data-lucide="trash-2" class="w-4 h-4"></i></button>
                                </div>
                            </td>
                        </tr>

                        <tr data-id="4" data-name="Pediatrics" data-department="Pediatrics">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center"><i data-lucide="heart-pulse" class="w-5 h-5"></i></span>
                                    <span class="font-semibold">Pediatrics</span>
                                </div>
                            </td>
                            <td class="px-6 py-4"><span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Pediatrics</span></td>
                            <td class="px-6 py-4 text-slate-600">4</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal(this.closest('tr'))" class="icon-btn hover:text-teal-600" aria-label="Edit"><i data-lucide="pencil" class="w-4 h-4"></i></button>
                                    <button type="button" onclick="confirmDelete(this.closest('tr'))" class="icon-btn hover:text-red-600 hover:bg-red-50" aria-label="Delete"><i data-lucide="trash-2" class="w-4 h-4"></i></button>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <p id="empty" class="hidden px-6 py-10 text-center text-slate-400">No specialty matches your search.</p>
            </section>
        </main>
    </div>
</div>

<!-- Add / edit modal -->
<div id="modal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50">
    <div class="w-full max-w-md bg-white rounded-2xl p-6 sm:p-8 shadow-xl">
        <div class="flex items-start justify-between">
            <h2 id="modalTitle" class="text-xl font-bold">Add specialty</h2>
            <button type="button" onclick="closeModal()" class="text-slate-400 hover:text-slate-700" aria-label="Close">
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin/specialties" class="mt-6 space-y-5">
            <input type="hidden" name="action" value="save">
            <input type="hidden" id="f-id" name="id">

            <div>
                <label class="label" for="f-name">Specialty name</label>
                <input id="f-name" name="name" type="text" required maxlength="100" placeholder="e.g. Cardiology" class="field">
            </div>

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

            <div class="flex gap-3 pt-2">
                <button type="button" onclick="closeModal()"
                        class="flex-1 border border-slate-200 hover:bg-slate-50 rounded-xl py-3 font-semibold text-slate-800 transition">Cancel</button>
                <button type="submit"
                        class="flex-1 bg-teal-600 hover:bg-teal-700 text-white rounded-xl py-3 font-semibold transition shadow-lg shadow-teal-600/20">Save</button>
            </div>
        </form>
    </div>
</div>

<form id="deleteForm" method="post" action="${pageContext.request.contextPath}/admin/specialties" class="hidden">
    <input type="hidden" name="action" value="delete">
    <input type="hidden" id="deleteId" name="id">
</form>

<script>
    lucide.createIcons();

    function openModal(row) {
        var d = row ? row.dataset : {};
        document.getElementById('modalTitle').textContent = row ? 'Edit specialty' : 'Add specialty';
        document.getElementById('f-id').value = d.id || '';
        document.getElementById('f-name').value = d.name || '';
        document.getElementById('f-department').value = d.department || '';
        document.getElementById('modal').classList.remove('hidden');
    }

    function closeModal() {
        document.getElementById('modal').classList.add('hidden');
    }

    function confirmDelete(row) {
        if (confirm('Delete the specialty "' + row.dataset.name + '"? This cannot be undone.')) {
            document.getElementById('deleteId').value = row.dataset.id;
            document.getElementById('deleteForm').submit();
        }
    }

    function filterRows() {
        var q = document.getElementById('q').value.trim().toLowerCase();
        var dept = document.getElementById('dept').value;
        var visible = 0;
        document.querySelectorAll('#rows tr').forEach(function (row) {
            var show = row.dataset.name.toLowerCase().indexOf(q) !== -1 && (!dept || row.dataset.department === dept);
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
