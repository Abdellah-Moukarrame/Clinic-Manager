<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Usage: <jsp:include page="/WEB-INF/fragments/patient-sidebar.jsp"><jsp:param name="active" value="dashboard"/></jsp:include> --%>
<!-- ============ SIDEBAR ============ -->
    <aside id="sidebar"
           class="hidden lg:flex lg:w-72 lg:shrink-0 flex-col
                  bg-[#0a1628] text-slate-300 px-6 py-8
                  fixed inset-y-0 left-0 z-40 lg:sticky lg:top-0 lg:h-screen">

        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/dashboard"
           class="flex items-center gap-3 mb-10">
            <span class="w-10 h-10 rounded-xl bg-teal-500 flex items-center justify-center">
                <i data-lucide="plus" class="w-6 h-6 text-white"></i>
            </span>
            <span class="text-xl font-bold text-white">Clinic<span class="text-teal-400">Manager</span></span>
        </a>

        <!-- Navigation -->
        <nav class="space-y-1 text-sm font-medium">
            <a href="${pageContext.request.contextPath}/patient/dashboard"
               class="flex items-center gap-3 rounded-xl px-4 py-3 ${param.active == 'dashboard' ? 'bg-teal-500/15 text-teal-300' : 'hover:bg-white/5 hover:text-white transition'}">
                <i data-lucide="layout-dashboard" class="w-5 h-5"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/patient/create-appointment"
               class="flex items-center gap-3 rounded-xl px-4 py-3 ${param.active == 'create-appointment' ? 'bg-teal-500/15 text-teal-300' : 'hover:bg-white/5 hover:text-white transition'}">
                <i data-lucide="calendar-plus" class="w-5 h-5"></i> Book an appointment
            </a>
            <a href="${pageContext.request.contextPath}/patient/appointments"
               class="flex items-center gap-3 rounded-xl px-4 py-3 ${param.active == 'appointments' ? 'bg-teal-500/15 text-teal-300' : 'hover:bg-white/5 hover:text-white transition'}">
                <i data-lucide="calendar-check" class="w-5 h-5"></i> My appointments
            </a>
            <a href="${pageContext.request.contextPath}/patient/history"
               class="flex items-center gap-3 rounded-xl px-4 py-3 ${param.active == 'history' ? 'bg-teal-500/15 text-teal-300' : 'hover:bg-white/5 hover:text-white transition'}">
                <i data-lucide="history" class="w-5 h-5"></i> History
            </a>
            <a href="${pageContext.request.contextPath}/patient/profile"
               class="flex items-center gap-3 rounded-xl px-4 py-3 ${param.active == 'profile' ? 'bg-teal-500/15 text-teal-300' : 'hover:bg-white/5 hover:text-white transition'}">
                <i data-lucide="user-round" class="w-5 h-5"></i> My profile
            </a>
        </nav>

        <!-- Logout -->
        <div class="mt-auto pt-6 border-t border-white/10">
            <a href="${pageContext.request.contextPath}/logout"
               class="flex items-center gap-3 rounded-xl px-4 py-3 text-sm font-medium
                      hover:bg-white/5 hover:text-white transition">
                <i data-lucide="log-out" class="w-5 h-5"></i> Sign out
            </a>
            <p class="px-4 mt-4 text-xs text-slate-500">&copy; 2026 ClinicManager</p>
        </div>
    </aside>

<div id="overlay" onclick="toggleSidebar()" class="hidden fixed inset-0 z-30 bg-black/50 lg:hidden"></div>

<script>
    function toggleSidebar() {
        var sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('hidden');
        sidebar.classList.toggle('flex');
        document.getElementById('overlay').classList.toggle('hidden');
    }
</script>
