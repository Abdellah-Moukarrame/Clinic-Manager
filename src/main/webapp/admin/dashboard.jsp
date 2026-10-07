<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin dashboard | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-slate-50 text-slate-900 antialiased">

<div class="min-h-screen lg:flex">

    <jsp:include page="/admin/sidebar.jsp">
        <jsp:param name="active" value="dashboard"/>
    </jsp:include>

    <!-- ============ MAIN ============ -->
    <div class="flex-1 min-w-0">

        <header class="sticky top-0 z-30 bg-white/80 backdrop-blur border-b border-slate-200">
            <div class="flex items-center justify-between px-5 sm:px-8 h-16">
                <button type="button" onclick="toggleSidebar()"
                        class="lg:hidden text-slate-600 hover:text-slate-900" aria-label="Open menu">
                    <i data-lucide="menu" class="w-6 h-6"></i>
                </button>

                <div class="hidden sm:block relative w-full max-w-md">
                    <i data-lucide="search"
                       class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"></i>
                    <input type="text" placeholder="Search a patient, doctor or CIN"
                           class="w-full border border-slate-200 rounded-xl pl-12 pr-4 py-2.5 bg-white
                                  text-sm placeholder:text-slate-400 outline-none transition
                                  focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10">
                </div>

                <div class="flex items-center gap-3 ml-auto">
                    <span class="hidden sm:inline rounded-full bg-slate-100 text-slate-600 text-xs font-semibold px-3 py-1">Administrator</span>
                    <div class="w-9 h-9 rounded-full bg-teal-600 text-white flex items-center justify-center
                                text-sm font-semibold">A</div>
                </div>
            </div>
        </header>

        <main class="px-5 sm:px-8 py-8 max-w-6xl">

            <section class="mb-8">
                <h1 class="text-3xl font-bold">Clinic overview</h1>
                <p class="mt-1 text-slate-500">Patients, doctors and appointments at a glance.</p>
            </section>

            <!-- Stats -->
            <section class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-5 mb-8">
                <div class="bg-white border border-slate-200 rounded-2xl p-5 flex items-center gap-4">
                    <span class="w-12 h-12 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                        <i data-lucide="users-round" class="w-6 h-6"></i>
                    </span>
                    <div>
                        <p class="text-2xl font-bold">248</p>
                        <p class="text-sm text-slate-500">Patients</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-200 rounded-2xl p-5 flex items-center gap-4">
                    <span class="w-12 h-12 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                        <i data-lucide="stethoscope" class="w-6 h-6"></i>
                    </span>
                    <div>
                        <p class="text-2xl font-bold">18</p>
                        <p class="text-sm text-slate-500">Doctors</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-200 rounded-2xl p-5 flex items-center gap-4">
                    <span class="w-12 h-12 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                        <i data-lucide="calendar-check" class="w-6 h-6"></i>
                    </span>
                    <div>
                        <p class="text-2xl font-bold">34</p>
                        <p class="text-sm text-slate-500">Appointments today</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-200 rounded-2xl p-5 flex items-center gap-4">
                    <span class="w-12 h-12 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center">
                        <i data-lucide="user-x" class="w-6 h-6"></i>
                    </span>
                    <div>
                        <p class="text-2xl font-bold">3</p>
                        <p class="text-sm text-slate-500">Disabled accounts</p>
                    </div>
                </div>
            </section>

            <div class="grid grid-cols-1 xl:grid-cols-3 gap-6">

                <div class="xl:col-span-2 space-y-6">

                    <!-- Weekly appointments: the one highlighted element -->
                    <section class="rounded-2xl bg-[#0a1628] text-white p-6 sm:p-8 relative overflow-hidden">
                        <div class="absolute -right-16 -top-16 w-64 h-64 rounded-full bg-teal-500/20 blur-3xl"></div>
                        <div class="relative">
                            <div class="flex items-start justify-between gap-4">
                                <div>
                                    <p class="text-sm text-teal-300 font-medium">Appointments this week</p>
                                    <p class="mt-1 text-4xl font-bold">187</p>
                                </div>
                                <span class="rounded-full bg-white/10 text-xs font-semibold px-3 py-1">Mon - Sat</span>
                            </div>

                            <div class="mt-8 flex items-end justify-between gap-3 h-40">
                                <div class="flex-1 flex flex-col items-center gap-2">
                                    <div class="w-full rounded-t-lg bg-teal-500/60" style="height:55%"></div>
                                    <span class="text-xs text-slate-300">Mon</span>
                                </div>
                                <div class="flex-1 flex flex-col items-center gap-2">
                                    <div class="w-full rounded-t-lg bg-teal-500/60" style="height:70%"></div>
                                    <span class="text-xs text-slate-300">Tue</span>
                                </div>
                                <div class="flex-1 flex flex-col items-center gap-2">
                                    <div class="w-full rounded-t-lg bg-teal-400" style="height:90%"></div>
                                    <span class="text-xs text-white font-semibold">Wed</span>
                                </div>
                                <div class="flex-1 flex flex-col items-center gap-2">
                                    <div class="w-full rounded-t-lg bg-teal-500/60" style="height:62%"></div>
                                    <span class="text-xs text-slate-300">Thu</span>
                                </div>
                                <div class="flex-1 flex flex-col items-center gap-2">
                                    <div class="w-full rounded-t-lg bg-teal-500/60" style="height:48%"></div>
                                    <span class="text-xs text-slate-300">Fri</span>
                                </div>
                                <div class="flex-1 flex flex-col items-center gap-2">
                                    <div class="w-full rounded-t-lg bg-teal-500/60" style="height:30%"></div>
                                    <span class="text-xs text-slate-300">Sat</span>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Recent patients -->
                    <section class="bg-white border border-slate-200 rounded-2xl">
                        <div class="flex items-center justify-between px-6 py-5 border-b border-slate-200">
                            <h2 class="text-lg font-semibold">Recent registrations</h2>
                            <a href="${pageContext.request.contextPath}/admin/patients"
                               class="text-sm font-semibold text-teal-600 hover:text-teal-700">View all</a>
                        </div>
                        <ul class="divide-y divide-slate-100">
                            <li class="flex items-center justify-between gap-4 px-6 py-4">
                                <div class="flex items-center gap-4 min-w-0">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">AK</span>
                                    <div class="min-w-0">
                                        <p class="font-medium truncate">Amine Karimi</p>
                                        <p class="text-sm text-slate-500 truncate">amine@example.com &middot; CIN AB123456</p>
                                    </div>
                                </div>
                                <span class="shrink-0 rounded-full bg-teal-50 text-teal-700 text-xs font-semibold px-3 py-1">Active</span>
                            </li>
                            <li class="flex items-center justify-between gap-4 px-6 py-4">
                                <div class="flex items-center gap-4 min-w-0">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">HB</span>
                                    <div class="min-w-0">
                                        <p class="font-medium truncate">Hajar Bennani</p>
                                        <p class="text-sm text-slate-500 truncate">hajar@example.com &middot; CIN CD789012</p>
                                    </div>
                                </div>
                                <span class="shrink-0 rounded-full bg-teal-50 text-teal-700 text-xs font-semibold px-3 py-1">Active</span>
                            </li>
                            <li class="flex items-center justify-between gap-4 px-6 py-4">
                                <div class="flex items-center gap-4 min-w-0">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-sm font-semibold">OT</span>
                                    <div class="min-w-0">
                                        <p class="font-medium truncate">Omar Tazi</p>
                                        <p class="text-sm text-slate-500 truncate">omar@example.com &middot; CIN EF345678</p>
                                    </div>
                                </div>
                                <span class="shrink-0 rounded-full bg-amber-50 text-amber-700 text-xs font-semibold px-3 py-1">Disabled</span>
                            </li>
                        </ul>
                    </section>
                </div>

                <!-- Right column -->
                <div class="space-y-6">

                    <section class="bg-white border border-slate-200 rounded-2xl p-6">
                        <h2 class="text-lg font-semibold mb-4">Quick actions</h2>
                        <div class="space-y-3">
                            <a href="${pageContext.request.contextPath}/admin/doctors/new"
                               class="flex items-center justify-center gap-2 w-full bg-teal-600 hover:bg-teal-700
                                      text-white rounded-xl py-3 font-semibold transition shadow-lg shadow-teal-600/20">
                                <i data-lucide="user-plus" class="w-4 h-4"></i> Add a doctor
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/specialties"
                               class="flex items-center justify-center gap-2 w-full border border-slate-200
                                      hover:bg-slate-50 rounded-xl py-3 font-semibold text-slate-800 transition">
                                <i data-lucide="heart-pulse" class="w-4 h-4"></i> Manage specialties
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/departments"
                               class="flex items-center justify-center gap-2 w-full border border-slate-200
                                      hover:bg-slate-50 rounded-xl py-3 font-semibold text-slate-800 transition">
                                <i data-lucide="building-2" class="w-4 h-4"></i> Manage departments
                            </a>
                        </div>
                    </section>

                    <section class="bg-white border border-slate-200 rounded-2xl p-6">
                        <h2 class="text-lg font-semibold mb-4">Doctors by department</h2>
                        <ul class="space-y-4 text-sm">
                            <li>
                                <div class="flex justify-between mb-1"><span class="font-medium">Medicine</span><span class="text-slate-500">7</span></div>
                                <div class="h-2 rounded-full bg-slate-100"><div class="h-full rounded-full bg-teal-500" style="width:70%"></div></div>
                            </li>
                            <li>
                                <div class="flex justify-between mb-1"><span class="font-medium">Surgery</span><span class="text-slate-500">5</span></div>
                                <div class="h-2 rounded-full bg-slate-100"><div class="h-full rounded-full bg-teal-500" style="width:50%"></div></div>
                            </li>
                            <li>
                                <div class="flex justify-between mb-1"><span class="font-medium">Pediatrics</span><span class="text-slate-500">4</span></div>
                                <div class="h-2 rounded-full bg-slate-100"><div class="h-full rounded-full bg-teal-500" style="width:40%"></div></div>
                            </li>
                            <li>
                                <div class="flex justify-between mb-1"><span class="font-medium">Emergency</span><span class="text-slate-500">2</span></div>
                                <div class="h-2 rounded-full bg-slate-100"><div class="h-full rounded-full bg-teal-500" style="width:20%"></div></div>
                            </li>
                        </ul>
                    </section>
                </div>
            </div>
        </main>
    </div>
</div>


<script>
    lucide.createIcons();
</script>

</body>
</html>
