<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Create Account | ClinicManager</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
</head>

<body class="min-h-screen bg-slate-50 text-slate-900 antialiased">

<div class="min-h-screen grid lg:grid-cols-2">

    <!-- ================= LEFT SIDE ================= -->
    <div class="hidden lg:flex relative overflow-hidden bg-slate-900 p-12 xl:p-16">

        <!-- Background decorations -->
        <div class="absolute top-0 right-0 w-96 h-96
                    bg-teal-500/20 rounded-full blur-3xl"></div>

        <div class="absolute bottom-0 left-0 w-96 h-96
                    bg-cyan-500/10 rounded-full blur-3xl"></div>


        <div class="relative z-10 flex flex-col w-full">

            <!-- Logo -->
            <a href="${pageContext.request.contextPath}/"
               class="flex items-center gap-3 w-fit">

                <div class="w-11 h-11 rounded-xl bg-teal-500
                            flex items-center justify-center">

                    <i data-lucide="cross"
                       class="w-5 h-5 text-white"></i>
                </div>

                <span class="text-xl font-bold text-white">
                    Clinic<span class="text-teal-400">Manager</span>
                </span>

            </a>


            <!-- Main content -->
            <div class="my-auto max-w-xl">

                <div class="inline-flex items-center gap-2
                            bg-white/5 border border-white/10
                            text-teal-300 rounded-full
                            px-4 py-2 text-sm font-medium">

                    <span class="w-2 h-2 bg-teal-400 rounded-full"></span>

                    Simple. Secure. Convenient.
                </div>


                <h1 class="mt-7 text-5xl xl:text-6xl
                           font-bold text-white tracking-tight leading-tight">

                    Your health journey
                    starts

                    <span class="text-teal-400">
                        here.
                    </span>
                </h1>


                <p class="mt-6 text-lg leading-8 text-slate-300">
                    Create your ClinicManager account to find doctors,
                    manage appointments and keep your healthcare
                    organized in one place.
                </p>


                <!-- Benefits -->
                <div class="mt-10 space-y-5">

                    <div class="flex items-center gap-4">

                        <div class="w-10 h-10 rounded-xl bg-white/10
                                    flex items-center justify-center">

                            <i data-lucide="search"
                               class="w-5 h-5 text-teal-400"></i>
                        </div>

                        <div>
                            <p class="text-white font-semibold">
                                Find the right doctor
                            </p>

                            <p class="text-sm text-slate-400">
                                Search doctors by specialty.
                            </p>
                        </div>

                    </div>


                    <div class="flex items-center gap-4">

                        <div class="w-10 h-10 rounded-xl bg-white/10
                                    flex items-center justify-center">

                            <i data-lucide="calendar-check"
                               class="w-5 h-5 text-teal-400"></i>
                        </div>

                        <div>
                            <p class="text-white font-semibold">
                                Easy appointments
                            </p>

                            <p class="text-sm text-slate-400">
                                Book and manage your appointments.
                            </p>
                        </div>

                    </div>


                    <div class="flex items-center gap-4">

                        <div class="w-10 h-10 rounded-xl bg-white/10
                                    flex items-center justify-center">

                            <i data-lucide="shield-check"
                               class="w-5 h-5 text-teal-400"></i>
                        </div>

                        <div>
                            <p class="text-white font-semibold">
                                Secure access
                            </p>

                            <p class="text-sm text-slate-400">
                                Your account and information stay protected.
                            </p>
                        </div>

                    </div>

                </div>

            </div>


            <!-- Bottom -->
            <p class="text-sm text-slate-500">
                © 2026 ClinicManager
            </p>

        </div>

    </div>



    <!-- ================= RIGHT SIDE ================= -->
    <div class="flex items-center justify-center
                px-6 py-12 sm:px-10 lg:px-16 bg-white">

        <div class="w-full max-w-md">

            <!-- Mobile Logo -->
            <a href="${pageContext.request.contextPath}/"
               class="lg:hidden flex items-center gap-3 mb-12">

                <div class="w-10 h-10 rounded-xl bg-teal-600
                            flex items-center justify-center">

                    <i data-lucide="cross"
                       class="w-5 h-5 text-white"></i>
                </div>

                <span class="text-xl font-bold">
                    Clinic<span class="text-teal-600">Manager</span>
                </span>

            </a>


            <!-- Back -->
            <a href="${pageContext.request.contextPath}/"
               class="inline-flex items-center gap-2
                      text-sm text-slate-500
                      hover:text-slate-900 transition">

                <i data-lucide="arrow-left"
                   class="w-4 h-4"></i>

                Back to home
            </a>


            <!-- Heading -->
            <div class="mt-8">

                <h2 class="text-3xl sm:text-4xl
                           font-bold tracking-tight">

                    Create your account
                </h2>

                <p class="mt-3 text-slate-500">
                    Enter your information to get started with ClinicManager.
                </p>

            </div>


            <!-- ERROR FROM SERVLET -->
            <% if (request.getAttribute("error") != null) { %>

                <div class="mt-6 flex gap-3
                            bg-red-50 border border-red-200
                            text-red-700 rounded-xl p-4">

                    <i data-lucide="circle-alert"
                       class="w-5 h-5 shrink-0 mt-0.5"></i>

                    <p class="text-sm">
                        <%= request.getAttribute("error") %>
                    </p>

                </div>

            <% } %>


            <!-- FORM -->
            <form method="post"
                  action="${pageContext.request.contextPath}/register"
                  class="mt-8 space-y-5">


                <!-- Email -->
                <div>

                    <label for="email"
                           class="block text-sm font-semibold text-slate-700 mb-2">
                        Email address
                    </label>

                    <div class="relative">

                        <i data-lucide="mail"
                           class="absolute left-4 top-1/2
                                  -translate-y-1/2
                                  w-5 h-5 text-slate-400"></i>

                        <input
                                id="email"
                                type="email"
                                name="email"
                                required
                                autocomplete="email"
                                placeholder="you@example.com"

                                class="w-full h-13
                                       border border-slate-200
                                       rounded-xl
                                       pl-12 pr-4 py-3.5
                                       bg-white
                                       text-slate-900
                                       placeholder:text-slate-400
                                       outline-none
                                       transition
                                       focus:border-teal-500
                                       focus:ring-4
                                       focus:ring-teal-500/10"
                        >

                    </div>

                </div>


                <!-- Password -->
                <div>

                    <label for="password"
                           class="block text-sm font-semibold text-slate-700 mb-2">
                        Password
                    </label>

                    <div class="relative">

                        <i data-lucide="lock-keyhole"
                           class="absolute left-4 top-1/2
                                  -translate-y-1/2
                                  w-5 h-5 text-slate-400"></i>

                        <input
                                id="password"
                                type="password"
                                name="password"
                                required
                                autocomplete="new-password"
                                placeholder="Create a password"

                                class="w-full
                                       border border-slate-200
                                       rounded-xl
                                       pl-12 pr-12 py-3.5
                                       bg-white
                                       text-slate-900
                                       placeholder:text-slate-400
                                       outline-none
                                       transition
                                       focus:border-teal-500
                                       focus:ring-4
                                       focus:ring-teal-500/10"
                        >

                        <!-- Show password -->
                        <button
                                type="button"
                                onclick="togglePassword()"
                                class="absolute right-4 top-1/2
                                       -translate-y-1/2
                                       text-slate-400
                                       hover:text-slate-700">

                            <i id="eyeIcon"
                               data-lucide="eye"
                               class="w-5 h-5"></i>

                        </button>

                    </div>

                    <p class="mt-2 text-xs text-slate-400">
                        Use a secure password to protect your account.
                    </p>

                </div>


                <!-- Submit -->
                <button
                        type="submit"

                        class="w-full flex items-center
                               justify-center gap-2
                               bg-teal-600
                               hover:bg-teal-700
                               text-white
                               rounded-xl
                               py-3.5
                               font-semibold
                               transition
                               shadow-lg
                               shadow-teal-600/20">

                    Create account

                    <i data-lucide="arrow-right"
                       class="w-4 h-4"></i>

                </button>

            </form>


            <!-- Divider -->
            <div class="flex items-center gap-4 my-8">

                <div class="h-px bg-slate-200 flex-1"></div>

                <span class="text-xs text-slate-400 uppercase tracking-wider">
                    Already registered?
                </span>

                <div class="h-px bg-slate-200 flex-1"></div>

            </div>


            <!-- Login -->
            <a href="${pageContext.request.contextPath}/login"

               class="w-full flex items-center justify-center
                      border border-slate-200
                      hover:bg-slate-50
                      rounded-xl py-3.5
                      font-semibold
                      text-slate-700
                      transition">

                Sign in to your account
            </a>


            <p class="text-center text-xs text-slate-400 mt-8 leading-5">
                By creating an account, you agree to use ClinicManager
                responsibly and keep your account information secure.
            </p>

        </div>

    </div>

</div>


<script>
    lucide.createIcons();

    function togglePassword() {

        const password = document.getElementById("password");
        const icon = document.getElementById("eyeIcon");

        if (password.type === "password") {

            password.type = "text";

            icon.setAttribute("data-lucide", "eye-off");

        } else {

            password.type = "password";

            icon.setAttribute("data-lucide", "eye");
        }

        lucide.createIcons();
    }
</script>

</body>
</html>