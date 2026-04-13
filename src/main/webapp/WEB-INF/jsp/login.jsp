<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Bootstrap 5 + Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600&display=swap" rel="stylesheet">

<style>
  body {
    background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Sora', sans-serif;
    overflow: hidden;
  }

  /* ── Floating background icons ── */
  .float-icon {
    position: fixed;
    opacity: 0.07;
    font-size: 3rem;
    color: #fff;
    animation: floatUp 6s ease-in-out infinite;
    pointer-events: none;
    z-index: 0;
  }
  .float-icon:nth-child(1) { left:  8%; top: 15%; animation-delay: 0s;   font-size: 3.5rem; }
  .float-icon:nth-child(2) { right: 9%; top: 20%; animation-delay: 1.5s; font-size: 2.5rem; }
  .float-icon:nth-child(3) { left: 12%; bottom: 20%; animation-delay: 3s; font-size: 3rem; }
  .float-icon:nth-child(4) { right: 7%; bottom: 25%; animation-delay: 2s; font-size: 2.2rem; }
  .float-icon:nth-child(5) { left: 48%; top:  6%; animation-delay: 1s;   font-size: 2rem; }
  .float-icon:nth-child(6) { left: 22%; top: 45%; animation-delay: 4s;   font-size: 1.8rem; }

  @keyframes floatUp {
    0%, 100% { transform: translateY(0)    rotate(0deg);  opacity: 0.07; }
    50%       { transform: translateY(-18px) rotate(8deg); opacity: 0.13; }
  }

  /* ── Card ── */
  .login-card {
    background: rgba(255, 255, 255, 0.07);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.15);
    border-radius: 20px;
    padding: 2.5rem 2.25rem;
    width: 100%;
    max-width: 400px;
    position: relative;
    z-index: 2;
  }

  /* ── Brand icon ── */
  .brand-icon {
    width: 64px; height: 64px;
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border-radius: 18px;
    display: flex; align-items: center; justify-content: center;
    font-size: 1.75rem;
    margin: 0 auto 1.1rem;
    box-shadow: 0 8px 24px rgba(79, 172, 254, 0.4);
  }

  .login-title   { color: #fff;                    font-size: 1.4rem; font-weight: 600; }
  .login-subtitle{ color: rgba(255,255,255,0.45);  font-size: 0.85rem; }

  /* ── Inputs ── */
  .input-wrapper { position: relative; }
  .input-icon {
    position: absolute; left: 14px; top: 50%;
    transform: translateY(-50%);
    color: rgba(255,255,255,0.4); font-size: 1rem;
    pointer-events: none;
  }
  .form-control-custom {
    background: rgba(255,255,255,0.08) !important;
    border: 1px solid rgba(255,255,255,0.15) !important;
    border-radius: 12px !important;
    color: #fff !important;
    padding: 0.7rem 0.9rem 0.7rem 2.6rem !important;
    font-size: 0.9rem;
    transition: border-color 0.2s, background 0.2s;
  }
  .form-control-custom::placeholder { color: rgba(255,255,255,0.3) !important; }
  .form-control-custom:focus {
    border-color: rgba(79, 172, 254, 0.7) !important;
    background: rgba(255,255,255,0.12) !important;
    box-shadow: 0 0 0 3px rgba(79, 172, 254, 0.15) !important;
    outline: none;
  }

  /* ── Forgot link ── */
  .forgot-link {
    font-size: 0.78rem;
    color: rgba(255,255,255,0.4);
    text-decoration: none;
    transition: color 0.2s;
  }
  .forgot-link:hover { color: #4facfe; }

  /* ── Login button ── */
  .btn-login {
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    border: none;
    border-radius: 12px;
    color: #0f2027;
    font-weight: 600;
    font-size: 0.95rem;
    padding: 0.75rem;
    width: 100%;
    letter-spacing: 0.3px;
    transition: transform 0.15s, box-shadow 0.15s;
    box-shadow: 0 6px 20px rgba(79, 172, 254, 0.35);
  }
  .btn-login:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 28px rgba(79, 172, 254, 0.5);
    color: #0f2027;
  }

  /* ── Divider ── */
  .divider { display: flex; align-items: center; gap: 10px; }
  .divider hr { flex: 1; border-color: rgba(255,255,255,0.12); opacity: 1; margin: 0; }
  .divider span { color: rgba(255,255,255,0.3); font-size: 0.78rem; }

  /* ── Register link ── */
  .register-text { color: rgba(255,255,255,0.4); font-size: 0.82rem; }
  .register-text a { color: #4facfe; text-decoration: none; font-weight: 500; }
  .register-text a:hover { text-decoration: underline; }
</style>

<!-- Floating background icons -->
<i class="bi bi-lock-fill float-icon"></i>
<i class="bi bi-shield-lock float-icon"></i>
<i class="bi bi-key-fill float-icon"></i>
<i class="bi bi-person-circle float-icon"></i>
<i class="bi bi-star-fill float-icon"></i>
<i class="bi bi-hexagon float-icon"></i>

<!-- Login Card -->
<div class="login-card">

  <!-- Brand -->
  <div class="text-center mb-3">
    <div class="brand-icon"><i class="bi bi-key-fill text-dark"></i></div>
    <h3 class="login-title">Welcome Back 👋</h3>
    <p class="login-subtitle">Sign in to continue to your account</p>
  </div>

  <!-- Error alert -->
  <c:if test="${not empty param.error}">
    <div class="alert d-flex align-items-center gap-2 py-2 px-3 mb-3"
         style="background:rgba(226,75,74,.18); border:1px solid rgba(226,75,74,.4);
                border-radius:10px; color:#f09595; font-size:.85rem;">
      <i class="bi bi-exclamation-triangle-fill"></i>
      <span><s:message code="error.login"/></span>
    </div>
  </c:if>

  <!-- Form -->
  <sf:form action="/login" method="post">

    <!-- Username -->
    <div class="input-wrapper mb-3">
      <i class="bi bi-person-fill input-icon"></i>
      <input type="text" name="userName" class="form-control form-control-custom"
             placeholder="Username" required autocomplete="username">
    </div>

    <!-- Password -->
    <div class="input-wrapper mb-1">
      <i class="bi bi-lock-fill input-icon"></i>
      <input type="password" name="userPassword" class="form-control form-control-custom"
             placeholder="Password" required autocomplete="current-password">
    </div>

    <!-- Forgot password -->
    <div class="text-end mb-3">
      <a href="#" class="forgot-link">Forgot password?</a>
    </div>

    <!-- Submit -->
    <button type="submit" class="btn btn-login">
      Login &nbsp;<i class="bi bi-arrow-right"></i>
    </button>

  </sf:form>

  <!-- Divider + Register -->
  <div class="divider my-3">
    <hr><span>or</span><hr>
  </div>

  <p class="register-text text-center mb-0">
    Don't have an account? <a href="/register">Register</a>
  </p>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>