<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ClinicManager | Your Health, Simplified</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
</head>

<body class="bg-white text-slate-900 antialiased">

<!-- NAVBAR -->
<header class="border-b border-slate-100 bg-white/90 backdrop-blur sticky top-0 z-50">
    <nav class="max-w-7xl mx-auto px-6 lg:px-8 h-20 flex items-center justify-between">

        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/"
           class="flex items-center gap-3">

            <div class="w-10 h-10 rounded-xl bg-teal-600 flex items-center justify-center shadow-sm">
                <i data-lucide="cross" class="w-5 h-5 text-white"></i>
            </div>

            <span class="text-xl font-bold tracking-tight">
                Clinic<span class="text-teal-600">Manager</span>
            </span>
        </a>

        <!-- Desktop navigation -->
        <div class="hidden md:flex items-center gap-8 text-sm font-medium text-slate-600">

            <a href="#home"
               class="hover:text-teal-600 transition">
                Home
            </a>

            <a href="#services"
               class="hover:text-teal-600 transition">
                Services
            </a>

            <a href="#how-it-works"
               class="hover:text-teal-600 transition">
                How it works
            </a>

            <a href="#about"
               class="hover:text-teal-600 transition">
                About
            </a>
        </div>

        <!-- Authentication -->
        <div class="flex items-center gap-3">

            <a href="${pageContext.request.contextPath}/login"
               class="hidden sm:block px-4 py-2 text-sm font-semibold
                      text-slate-700 hover:text-teal-600 transition">
                Sign in
            </a>

            <a href="${pageContext.request.contextPath}/register"
               class="px-5 py-2.5 bg-teal-600 text-white rounded-xl
                      text-sm font-semibold hover:bg-teal-700 transition
                      shadow-sm">
                Get started
            </a>
        </div>

    </nav>
</header>


<main>

<!-- HERO -->
<section id="home"
         class="relative overflow-hidden bg-gradient-to-b from-teal-50/70 via-white to-white">

    <!-- decoration -->
    <div class="absolute top-20 right-0 w-96 h-96 bg-teal-100/60 rounded-full blur-3xl"></div>
    <div class="absolute bottom-0 left-0 w-72 h-72 bg-cyan-100/40 rounded-full blur-3xl"></div>

    <div class="relative max-w-7xl mx-auto px-6 lg:px-8 py-20 lg:py-28">

        <div class="grid lg:grid-cols-2 gap-16 items-center">

            <!-- Hero text -->
            <div>

                <div class="inline-flex items-center gap-2 border border-teal-200
                            bg-white text-teal-700 rounded-full px-4 py-2
                            text-sm font-medium shadow-sm">

                    <span class="w-2 h-2 rounded-full bg-teal-500"></span>

                    Your healthcare, all in one place
                </div>

                <h1 class="mt-7 text-5xl sm:text-6xl lg:text-7xl
                           font-bold tracking-tight leading-[1.08]">

                    Better care starts
                    with a

                    <span class="text-teal-600">
                        simple click.
                    </span>
                </h1>

                <p class="mt-7 text-lg text-slate-600 leading-8 max-w-xl">
                    Find the right doctor, check their availability and
                    book your appointment easily with ClinicManager.
                </p>

                <div class="mt-9 flex flex-col sm:flex-row gap-4">

                    <a href="${pageContext.request.contextPath}/register"
                       class="inline-flex justify-center items-center gap-2
                              bg-teal-600 text-white px-7 py-3.5 rounded-xl
                              font-semibold hover:bg-teal-700 transition
                              shadow-lg shadow-teal-600/20">

                        Book an appointment

                        <i data-lucide="arrow-right"
                           class="w-4 h-4"></i>
                    </a>

                    <a href="#services"
                       class="inline-flex justify-center items-center
                              bg-white border border-slate-200 text-slate-700
                              px-7 py-3.5 rounded-xl font-semibold
                              hover:bg-slate-50 transition">

                        Explore services
                    </a>

                </div>

                <!-- benefits -->
                <div class="mt-10 flex flex-wrap gap-x-7 gap-y-3 text-sm text-slate-600">

                    <span class="flex items-center gap-2">
                        <i data-lucide="check-circle-2"
                           class="w-4 h-4 text-teal-600"></i>
                        Easy booking
                    </span>

                    <span class="flex items-center gap-2">
                        <i data-lucide="check-circle-2"
                           class="w-4 h-4 text-teal-600"></i>
                        Secure access
                    </span>

                    <span class="flex items-center gap-2">
                        <i data-lucide="check-circle-2"
                           class="w-4 h-4 text-teal-600"></i>
                        Doctor availability
                    </span>

                </div>

            </div>


            <!-- Hero UI preview -->
            <div class="relative lg:pl-8">

                <div class="bg-white border border-slate-200 rounded-[2rem]
                            shadow-2xl shadow-slate-200/70 p-5 sm:p-7">

                    <!-- fake window header -->
                    <div class="flex justify-between items-center pb-6 border-b border-slate-100">

                        <div>
                            <p class="text-xs uppercase tracking-wider font-semibold text-teal-600">
                                ClinicManager
                            </p>

                            <h2 class="font-bold text-xl mt-1">
                                Find your doctor
                            </h2>
                        </div>

                        <div class="w-11 h-11 rounded-full bg-teal-50
                                    flex items-center justify-center">
                            <i data-lucide="stethoscope"
                               class="w-5 h-5 text-teal-600"></i>
                        </div>
                    </div>

                    <!-- Search -->
                    <div class="mt-6 flex items-center gap-3 bg-slate-50
                                border border-slate-200 rounded-xl px-4 py-3">

                        <i data-lucide="search"
                           class="w-5 h-5 text-slate-400"></i>

                        <span class="text-sm text-slate-400">
                            Search by doctor or specialty...
                        </span>
                    </div>


                    <div class="mt-6 space-y-4">

                        <!-- Doctor -->
                        <div class="border border-slate-200 rounded-2xl p-4
                                    flex items-center justify-between
                                    hover:border-teal-300 transition">

                            <div class="flex items-center gap-4">

                                <div class="w-12 h-12 bg-slate-100 rounded-full
                                            flex items-center justify-center">
                                    <i data-lucide="user-round"
                                       class="w-6 h-6 text-slate-500"></i>
                                </div>

                                <div>
                                    <h3 class="font-semibold">
                                        Dr. Sarah Martin
                                    </h3>

                                    <p class="text-sm text-slate-500 mt-0.5">
                                        General Medicine
                                    </p>
                                </div>

                            </div>

                            <span class="text-xs font-semibold text-emerald-700
                                         bg-emerald-50 px-3 py-1.5 rounded-full">
                                Available
                            </span>

                        </div>


                        <!-- Appointment -->
                        <div class="bg-slate-900 text-white rounded-2xl p-5">

                            <div class="flex justify-between items-start">

                                <div>
                                    <p class="text-xs text-slate-400">
                                        NEXT AVAILABLE
                                    </p>

                                    <p class="font-semibold mt-1">
                                        Today, 14:30
                                    </p>
                                </div>

                                <div class="w-10 h-10 rounded-xl bg-white/10
                                            flex items-center justify-center">

                                    <i data-lucide="calendar-days"
                                       class="w-5 h-5"></i>
                                </div>

                            </div>

                            <button class="w-full mt-5 bg-teal-500
                                           hover:bg-teal-400 transition
                                           rounded-xl py-3 text-sm font-semibold">
                                Choose appointment
                            </button>

                        </div>

                    </div>

                </div>

                <!-- floating card -->
                <div class="hidden sm:flex absolute -left-5 bottom-12
                            bg-white border border-slate-200 shadow-xl
                            rounded-2xl px-5 py-4 items-center gap-3">

                    <div class="w-10 h-10 rounded-full bg-emerald-50
                                flex items-center justify-center">

                        <i data-lucide="check"
                           class="w-5 h-5 text-emerald-600"></i>
                    </div>

                    <div>
                        <p class="font-semibold text-sm">
                            Appointment confirmed
                        </p>

                        <p class="text-xs text-slate-500 mt-0.5">
                            Your visit has been scheduled
                        </p>
                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- SERVICES -->
<section id="services" class="py-24 bg-white">

    <div class="max-w-7xl mx-auto px-6 lg:px-8">

        <div class="max-w-2xl">

            <p class="text-sm font-bold uppercase tracking-widest text-teal-600">
                Services
            </p>

            <h2 class="text-4xl lg:text-5xl font-bold tracking-tight mt-3">
                Everything you need to manage your care.
            </h2>

            <p class="text-slate-600 mt-5 text-lg">
                A simple platform connecting patients and healthcare
                professionals.
            </p>

        </div>


        <div class="grid md:grid-cols-3 gap-6 mt-14">

            <!-- Card 1 -->
            <div class="group border border-slate-200 rounded-2xl p-7
                        hover:-translate-y-1 hover:shadow-xl
                        hover:shadow-slate-200/60 transition duration-300">

                <div class="w-12 h-12 rounded-xl bg-teal-50
                            flex items-center justify-center">

                    <i data-lucide="search"
                       class="w-6 h-6 text-teal-600"></i>
                </div>

                <h3 class="text-xl font-bold mt-6">
                    Find a doctor
                </h3>

                <p class="text-slate-600 leading-7 mt-3">
                    Search healthcare professionals and find the
                    specialist that matches your needs.
                </p>

                <a href="${pageContext.request.contextPath}/register"
                   class="inline-flex items-center gap-2 mt-6 text-sm
                          font-semibold text-teal-600">

                    Find a doctor
                    <i data-lucide="arrow-right" class="w-4 h-4"></i>
                </a>

            </div>


            <!-- Card 2 -->
            <div class="group border border-slate-200 rounded-2xl p-7
                        hover:-translate-y-1 hover:shadow-xl
                        hover:shadow-slate-200/60 transition duration-300">

                <div class="w-12 h-12 rounded-xl bg-blue-50
                            flex items-center justify-center">

                    <i data-lucide="calendar-days"
                       class="w-6 h-6 text-blue-600"></i>
                </div>

                <h3 class="text-xl font-bold mt-6">
                    Book appointments
                </h3>

                <p class="text-slate-600 leading-7 mt-3">
                    Check doctor availability and select the date
                    and time that works for you.
                </p>

                <a href="${pageContext.request.contextPath}/register"
                   class="inline-flex items-center gap-2 mt-6 text-sm
                          font-semibold text-teal-600">

                    Book now
                    <i data-lucide="arrow-right" class="w-4 h-4"></i>
                </a>

            </div>


            <!-- Card 3 -->
            <div class="group border border-slate-200 rounded-2xl p-7
                        hover:-translate-y-1 hover:shadow-xl
                        hover:shadow-slate-200/60 transition duration-300">

                <div class="w-12 h-12 rounded-xl bg-violet-50
                            flex items-center justify-center">

                    <i data-lucide="clipboard-list"
                       class="w-6 h-6 text-violet-600"></i>
                </div>

                <h3 class="text-xl font-bold mt-6">
                    Manage your visits
                </h3>

                <p class="text-slate-600 leading-7 mt-3">
                    View upcoming appointments and manage your
                    healthcare schedule from one place.
                </p>

                <a href="${pageContext.request.contextPath}/login"
                   class="inline-flex items-center gap-2 mt-6 text-sm
                          font-semibold text-teal-600">

                    View appointments
                    <i data-lucide="arrow-right" class="w-4 h-4"></i>
                </a>

            </div>

        </div>

    </div>

</section>


<!-- HOW IT WORKS -->
<section id="how-it-works" class="bg-slate-50 py-24">

    <div class="max-w-7xl mx-auto px-6 lg:px-8">

        <div class="text-center max-w-2xl mx-auto">

            <p class="text-sm font-bold uppercase tracking-widest text-teal-600">
                How it works
            </p>

            <h2 class="text-4xl font-bold mt-3">
                Book your visit in three steps
            </h2>

        </div>


        <div class="grid md:grid-cols-3 gap-10 mt-16">

            <div class="text-center">

                <div class="w-14 h-14 mx-auto bg-teal-600 text-white
                            rounded-2xl flex items-center justify-center
                            font-bold text-lg shadow-lg shadow-teal-600/20">
                    01
                </div>

                <h3 class="font-bold text-lg mt-5">
                    Create your account
                </h3>

                <p class="text-slate-500 mt-2">
                    Register securely as a patient.
                </p>

            </div>


            <div class="text-center">

                <div class="w-14 h-14 mx-auto bg-white border border-slate-200
                            rounded-2xl flex items-center justify-center
                            font-bold text-lg">
                    02
                </div>

                <h3 class="font-bold text-lg mt-5">
                    Choose your doctor
                </h3>

                <p class="text-slate-500 mt-2">
                    Find a doctor by specialty and availability.
                </p>

            </div>


            <div class="text-center">

                <div class="w-14 h-14 mx-auto bg-white border border-slate-200
                            rounded-2xl flex items-center justify-center
                            font-bold text-lg">
                    03
                </div>

                <h3 class="font-bold text-lg mt-5">
                    Confirm your appointment
                </h3>

                <p class="text-slate-500 mt-2">
                    Select an available slot and confirm your visit.
                </p>

            </div>

        </div>

    </div>

</section>


<!-- CTA -->
<section class="py-24 bg-white">

    <div class="max-w-6xl mx-auto px-6">

        <div class="relative overflow-hidden bg-slate-900 rounded-[2rem]
                    px-8 py-16 md:px-16 md:py-20">

            <div class="absolute right-0 top-0 w-80 h-80
                        bg-teal-500/20 rounded-full blur-3xl"></div>

            <div class="relative max-w-2xl">

                <p class="text-teal-400 font-semibold">
                    Start today
                </p>

                <h2 class="text-4xl md:text-5xl font-bold text-white
                           tracking-tight mt-3">

                    Your next appointment is only a few clicks away.
                </h2>

                <p class="text-slate-300 mt-5 text-lg">
                    Create your ClinicManager account and manage your
                    healthcare appointments more easily.
                </p>

                <a href="${pageContext.request.contextPath}/register"
                   class="inline-flex items-center gap-2 mt-8 bg-teal-500
                          hover:bg-teal-400 text-white px-7 py-3.5
                          rounded-xl font-semibold transition">

                    Create an account

                    <i data-lucide="arrow-right"
                       class="w-4 h-4"></i>
                </a>

            </div>

        </div>

    </div>

</section>

</main>


<!-- FOOTER -->
<footer class="border-t border-slate-200 bg-white">

    <div class="max-w-7xl mx-auto px-6 lg:px-8 py-10">

        <div class="flex flex-col md:flex-row items-center justify-between gap-6">

            <a href="${pageContext.request.contextPath}/"
               class="flex items-center gap-2">

                <div class="w-8 h-8 rounded-lg bg-teal-600
                            flex items-center justify-center">

                    <i data-lucide="cross"
                       class="w-4 h-4 text-white"></i>
                </div>

                <span class="font-bold">
                    Clinic<span class="text-teal-600">Manager</span>
                </span>
            </a>

            <div class="flex gap-6 text-sm text-slate-500">

                <a href="#services" class="hover:text-slate-900">
                    Services
                </a>

                <a href="#how-it-works" class="hover:text-slate-900">
                    How it works
                </a>

                <a href="#about" class="hover:text-slate-900">
                    About
                </a>

            </div>

            <p class="text-sm text-slate-400">
                © 2026 ClinicManager
            </p>

        </div>

    </div>

</footer>


<script>
    lucide.createIcons();
</script>

</body>
</html>