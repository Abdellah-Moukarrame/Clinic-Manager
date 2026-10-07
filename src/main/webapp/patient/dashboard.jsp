<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-slate-50 text-slate-900 antialiased">

<div class="min-h-screen lg:flex">

    <jsp:include page="/WEB-INF/fragments/sidebar.jsp">
        <jsp:param name="active" value="dashboard"/>
    </jsp:include>

    <!-- ============ MAIN ============ -->
    <div class="flex-1 min-w-0">

        <!-- Top bar -->
        <header class="sticky top-0 z-30 bg-white/80 backdrop-blur border-b border-slate-200">
            <div class="flex items-center justify-between px-5 sm:px-8 h-16">
                <button type="button" onclick="toggleSidebar()"
                        class="lg:hidden text-slate-600 hover:text-slate-900"
                        aria-label="Open menu">
                    <i data-lucide="menu" class="w-6 h-6"></i>
                </button>

                <div class="hidden sm:block relative w-full max-w-md">
                    <i data-lucide="search"
                       class="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-slate-400"></i>
                    <input type="text" placeholder="Search doctors by name or specialty"
                           class="w-full border border-slate-200 rounded-xl pl-12 pr-4 py-2.5 bg-white
                                  text-sm placeholder:text-slate-400 outline-none transition
                                  focus:border-teal-500 focus:ring-4 focus:ring-teal-500/10">
                </div>

                <div class="flex items-center gap-4 ml-auto">
                    <button type="button" class="relative text-slate-500 hover:text-slate-900" aria-label="Notifications">
                        <i data-lucide="bell" class="w-5 h-5"></i>
                        <span class="absolute -top-0.5 -right-0.5 w-2 h-2 rounded-full bg-teal-500"></span>
                    </button>
                    <div class="w-9 h-9 rounded-full bg-teal-600 text-white flex items-center justify-center
                                text-sm font-semibold">P</div>
                </div>
            </div>
        </header>

        <main class="px-5 sm:px-8 py-8 max-w-6xl">

            <!-- Welcome -->
            <section class="mb-8">
                <h1 class="text-3xl font-bold text-slate-900">Welcome back</h1>
                <p class="mt-1 text-slate-500">Here is what is coming up in your care.</p>
            </section>

            <!-- Stats -->
            <section class="grid grid-cols-1 sm:grid-cols-3 gap-5 mb-8">
                <div class="bg-white border border-slate-200 rounded-2xl p-5 flex items-center gap-4">
                    <span class="w-12 h-12 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                        <i data-lucide="calendar-clock" class="w-6 h-6"></i>
                    </span>
                    <div>
                        <p class="text-2xl font-bold">2</p>
                        <p class="text-sm text-slate-500">Upcoming appointments</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-200 rounded-2xl p-5 flex items-center gap-4">
                    <span class="w-12 h-12 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                        <i data-lucide="check-circle-2" class="w-6 h-6"></i>
                    </span>
                    <div>
                        <p class="text-2xl font-bold">8</p>
                        <p class="text-sm text-slate-500">Completed visits</p>
                    </div>
                </div>
                <div class="bg-white border border-slate-200 rounded-2xl p-5 flex items-center gap-4">
                    <span class="w-12 h-12 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center">
                        <i data-lucide="users-round" class="w-6 h-6"></i>
                    </span>
                    <div>
                        <p class="text-2xl font-bold">3</p>
                        <p class="text-sm text-slate-500">Doctors you see</p>
                    </div>
                </div>
            </section>

            <div class="grid grid-cols-1 xl:grid-cols-3 gap-6">

                <!-- Next appointment + list -->
                <div class="xl:col-span-2 space-y-6">

                    <!-- Next appointment (the one highlighted element) -->
                    <section class="rounded-2xl bg-[#0a1628] text-white p-6 sm:p-8 relative overflow-hidden">
                        <div class="absolute -right-16 -top-16 w-64 h-64 rounded-full bg-teal-500/20 blur-3xl"></div>
                        <div class="relative">
                            <p class="text-sm text-teal-300 font-medium">Your next appointment</p>
                            <h2 class="mt-2 text-2xl sm:text-3xl font-bold">Dr. Sara Benali</h2>
                            <p class="text-slate-300">Cardiology</p>

                            <div class="mt-5 flex flex-wrap gap-x-8 gap-y-3 text-sm text-slate-200">
                                <span class="flex items-center gap-2">
                                    <i data-lucide="calendar" class="w-4 h-4 text-teal-400"></i> Thu, 8 October 2026
                                </span>
                                <span class="flex items-center gap-2">
                                    <i data-lucide="clock" class="w-4 h-4 text-teal-400"></i> 10:30
                                </span>
                                <span class="flex items-center gap-2">
                                    <i data-lucide="map-pin" class="w-4 h-4 text-teal-400"></i> Room 12, 2nd floor
                                </span>
                            </div>

                            <div class="mt-6 flex flex-wrap gap-3">
                                <a href="#"
                                   class="rounded-xl bg-teal-600 hover:bg-teal-700 px-5 py-2.5 text-sm font-semibold transition">
                                    View details
                                </a>
                                <a href="#"
                                   class="rounded-xl border border-white/20 hover:bg-white/10 px-5 py-2.5 text-sm font-semibold transition">
                                    Reschedule
                                </a>
                            </div>
                        </div>
                    </section>

                    <!-- Appointments list -->
                    <section class="bg-white border border-slate-200 rounded-2xl">
                        <div class="flex items-center justify-between px-6 py-5 border-b border-slate-200">
                            <h2 class="text-lg font-semibold">Recent appointments</h2>
                            <a href="${pageContext.request.contextPath}/patient/appointments"
                               class="text-sm font-semibold text-teal-600 hover:text-teal-700">View all</a>
                        </div>

                        <ul class="divide-y divide-slate-100">
                            <li class="flex items-center justify-between gap-4 px-6 py-4">
                                <div class="flex items-center gap-4 min-w-0">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600
                                                 flex items-center justify-center text-sm font-semibold">SB</span>
                                    <div class="min-w-0">
                                        <p class="font-medium truncate">Dr. Sara Benali</p>
                                        <p class="text-sm text-slate-500 truncate">Cardiology &middot; 8 Oct, 10:30</p>
                                    </div>
                                </div>
                                <span class="shrink-0 rounded-full bg-amber-50 text-amber-700 text-xs font-semibold px-3 py-1">Pending</span>
                            </li>
                            <li class="flex items-center justify-between gap-4 px-6 py-4">
                                <div class="flex items-center gap-4 min-w-0">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600
                                                 flex items-center justify-center text-sm font-semibold">YA</span>
                                    <div class="min-w-0">
                                        <p class="font-medium truncate">Dr. Youssef Alaoui</p>
                                        <p class="text-sm text-slate-500 truncate">Dermatology &middot; 14 Oct, 15:00</p>
                                    </div>
                                </div>
                                <span class="shrink-0 rounded-full bg-teal-50 text-teal-700 text-xs font-semibold px-3 py-1">Confirmed</span>
                            </li>
                            <li class="flex items-center justify-between gap-4 px-6 py-4">
                                <div class="flex items-center gap-4 min-w-0">
                                    <span class="w-10 h-10 shrink-0 rounded-full bg-slate-100 text-slate-600
                                                 flex items-center justify-center text-sm font-semibold">LM</span>
                                    <div class="min-w-0">
                                        <p class="font-medium truncate">Dr. Laila Mansouri</p>
                                        <p class="text-sm text-slate-500 truncate">General medicine &middot; 22 Sep, 09:00</p>
                                    </div>
                                </div>
                                <span class="shrink-0 rounded-full bg-slate-100 text-slate-600 text-xs font-semibold px-3 py-1">Completed</span>
                            </li>
                        </ul>
                    </section>
                </div>

                <!-- Right column -->
                <div class="space-y-6">

                    <!-- Quick actions -->
                    <section class="bg-white border border-slate-200 rounded-2xl p-6">
                        <h2 class="text-lg font-semibold mb-4">Quick actions</h2>
                        <div class="space-y-3">
                            <a href="${pageContext.request.contextPath}/patient/create-appointment"
                               class="flex items-center justify-center gap-2 w-full bg-teal-600 hover:bg-teal-700
                                      text-white rounded-xl py-3 font-semibold transition shadow-lg shadow-teal-600/20">
                                <i data-lucide="calendar-plus" class="w-4 h-4"></i> Book an appointment
                            </a>
                            <a href="${pageContext.request.contextPath}/patient/history"
                               class="flex items-center justify-center gap-2 w-full border border-slate-200
                                      hover:bg-slate-50 rounded-xl py-3 font-semibold text-slate-800 transition">
                                <i data-lucide="history" class="w-4 h-4"></i> View history
                            </a>
                            <a href="${pageContext.request.contextPath}/patient/profile"
                               class="flex items-center justify-center gap-2 w-full border border-slate-200
                                      hover:bg-slate-50 rounded-xl py-3 font-semibold text-slate-800 transition">
                                <i data-lucide="user-round-pen" class="w-4 h-4"></i> Update my profile
                            </a>
                        </div>
                    </section>

                    <!-- Profile status -->
                    <section class="bg-white border border-slate-200 rounded-2xl p-6">
                        <h2 class="text-lg font-semibold">Complete your profile</h2>
                        <p class="mt-1 text-sm text-slate-500">
                            Add your birth date, phone and blood group so doctors have what they need.
                        </p>
                        <div class="mt-4 h-2 rounded-full bg-slate-100 overflow-hidden">
                            <div class="h-full w-2/5 rounded-full bg-teal-500"></div>
                        </div>
                        <p class="mt-2 text-xs text-slate-400">40% complete</p>
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
