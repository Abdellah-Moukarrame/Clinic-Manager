<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Departments | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-slate-50 text-slate-900 antialiased">

<div class="min-h-screen lg:flex">

    <jsp:include page="/admin/sidebar.jsp">
        <jsp:param name="active" value="departments"/>
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

            <!-- Title + action -->
            <section class="flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4 mb-8">
                <div>
                    <h1 class="text-3xl font-bold">Departments</h1>
                    <p class="mt-1 text-slate-500">Organize the clinic into departments, each with its specialties.</p>
                </div>
                <button type="button" onclick="openModal('', '')"
                        class="flex items-center justify-center gap-2 bg-teal-600 hover:bg-teal-700 text-white
                               rounded-xl px-5 py-3 font-semibold transition shadow-lg shadow-teal-600/20">
                    <i data-lucide="plus" class="w-4 h-4"></i> Add department
                </button>
            </section>

            <!-- Search -->
            <div class="relative max-w-md mb-6">
                <i data-lucide="search" class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"></i>
                <input type="text" id="filter" oninput="filterRows()" placeholder="Search a department"
                       class="w-full border border-slate-200 rounded-xl pl-12 pr-4 py-3 bg-white text-sm
                              placeholder:text-slate-400 outline-none transition
                              focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10">
            </div>

            <!-- Table -->
            <section class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full text-sm">
                        <thead class="bg-slate-50 text-left text-slate-500">
                        <tr>
                            <th class="px-6 py-4 font-semibold">Department</th>
                            <th class="px-6 py-4 font-semibold">Specialties</th>
                            <th class="px-6 py-4 font-semibold">Doctors</th>
                            <th class="px-6 py-4 font-semibold text-right">Actions</th>
                        </tr>
                        </thead>
                        <tbody id="rows" class="divide-y divide-slate-100">

                        <tr data-name="medicine">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                                        <i data-lucide="building-2" class="w-5 h-5"></i>
                                    </span>
                                    <span class="font-semibold">Medicine</span>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex flex-wrap gap-2">
                                    <span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Cardiology</span>
                                    <span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Neurology</span>
                                    <span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Dermatology</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">7</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal('1', 'Medicine')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-teal-600 hover:bg-slate-50 flex items-center justify-center"
                                            aria-label="Edit">
                                        <i data-lucide="pencil" class="w-4 h-4"></i>
                                    </button>
                                    <button type="button" onclick="confirmDelete('1', 'Medicine')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-red-600 hover:bg-red-50 flex items-center justify-center"
                                            aria-label="Delete">
                                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <tr data-name="surgery">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                                        <i data-lucide="building-2" class="w-5 h-5"></i>
                                    </span>
                                    <span class="font-semibold">Surgery</span>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex flex-wrap gap-2">
                                    <span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Orthopedics</span>
                                    <span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Neurosurgery</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">5</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal('2', 'Surgery')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-teal-600 hover:bg-slate-50 flex items-center justify-center"
                                            aria-label="Edit">
                                        <i data-lucide="pencil" class="w-4 h-4"></i>
                                    </button>
                                    <button type="button" onclick="confirmDelete('2', 'Surgery')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-red-600 hover:bg-red-50 flex items-center justify-center"
                                            aria-label="Delete">
                                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <tr data-name="pediatrics">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                                        <i data-lucide="building-2" class="w-5 h-5"></i>
                                    </span>
                                    <span class="font-semibold">Pediatrics</span>
                                </div>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex flex-wrap gap-2">
                                    <span class="rounded-full bg-slate-100 text-slate-600 text-xs font-medium px-3 py-1">Pediatrics</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-600">4</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal('3', 'Pediatrics')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-teal-600 hover:bg-slate-50 flex items-center justify-center"
                                            aria-label="Edit">
                                        <i data-lucide="pencil" class="w-4 h-4"></i>
                                    </button>
                                    <button type="button" onclick="confirmDelete('3', 'Pediatrics')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-red-600 hover:bg-red-50 flex items-center justify-center"
                                            aria-label="Delete">
                                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <tr data-name="emergency">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-3">
                                    <span class="w-10 h-10 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                                        <i data-lucide="building-2" class="w-5 h-5"></i>
                                    </span>
                                    <span class="font-semibold">Emergency</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-slate-400">No specialties yet</td>
                            <td class="px-6 py-4 text-slate-600">2</td>
                            <td class="px-6 py-4">
                                <div class="flex justify-end gap-2">
                                    <button type="button" onclick="openModal('4', 'Emergency')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-teal-600 hover:bg-slate-50 flex items-center justify-center"
                                            aria-label="Edit">
                                        <i data-lucide="pencil" class="w-4 h-4"></i>
                                    </button>
                                    <button type="button" onclick="confirmDelete('4', 'Emergency')"
                                            class="w-9 h-9 rounded-lg border border-slate-200 text-slate-500 hover:text-red-600 hover:bg-red-50 flex items-center justify-center"
                                            aria-label="Delete">
                                        <i data-lucide="trash-2" class="w-4 h-4"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <p id="empty" class="hidden px-6 py-10 text-center text-slate-400">No department matches your search.</p>
            </section>
        </main>
    </div>
</div>

<!-- ===== Add / edit modal ===== -->
<div id="modal" class="hidden fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50">
    <div class="w-full max-w-md bg-white rounded-2xl p-6 sm:p-8 shadow-xl">
        <div class="flex items-start justify-between">
            <h2 id="modalTitle" class="text-xl font-bold">Add department</h2>
            <button type="button" onclick="closeModal()" class="text-slate-400 hover:text-slate-700" aria-label="Close">
                <i data-lucide="x" class="w-5 h-5"></i>
            </button>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin/departments" class="mt-6 space-y-5">
            <input type="hidden" name="action" value="save">
            <input type="hidden" id="deptId" name="id">

            <div>
                <label for="deptName" class="block text-sm font-semibold text-slate-700 mb-2">Department name</label>
                <div class="relative">
                    <i data-lucide="building-2" class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"></i>
                    <input id="deptName" type="text" name="name" required maxlength="100" placeholder="e.g. Cardiology unit"
                           class="w-full border border-slate-200 rounded-xl pl-12 pr-4 py-3.5 bg-white text-slate-900
                                  placeholder:text-slate-400 outline-none transition
                                  focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10">
                </div>
            </div>

            <div class="flex gap-3">
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

<!-- ===== Delete form (hidden, submitted after confirmation) ===== -->
<form id="deleteForm" method="post" action="${pageContext.request.contextPath}/admin/departments" class="hidden">
    <input type="hidden" name="action" value="delete">
    <input type="hidden" id="deleteId" name="id">
</form>

<script>
    lucide.createIcons();

    function openModal(id, name) {
        document.getElementById('deptId').value = id;
        document.getElementById('deptName').value = name;
        document.getElementById('modalTitle').textContent = id ? 'Edit department' : 'Add department';
        document.getElementById('modal').classList.remove('hidden');
        document.getElementById('deptName').focus();
    }

    function closeModal() {
        document.getElementById('modal').classList.add('hidden');
    }

    function confirmDelete(id, name) {
        if (confirm('Delete the department "' + name + '"? This cannot be undone.')) {
            document.getElementById('deleteId').value = id;
            document.getElementById('deleteForm').submit();
        }
    }

    function filterRows() {
        var q = document.getElementById('filter').value.trim().toLowerCase();
        var rows = document.querySelectorAll('#rows tr');
        var visible = 0;
        rows.forEach(function (row) {
            var match = row.getAttribute('data-name').indexOf(q) !== -1;
            row.classList.toggle('hidden', !match);
            if (match) visible++;
        });
        document.getElementById('empty').classList.toggle('hidden', visible !== 0);
    }

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') closeModal();
    });
</script>

</body>
</html>
