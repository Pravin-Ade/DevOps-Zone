# 🌐 HTTP Status Code Cheat Sheet (By Category)

---

## ✅ 2xx — Success
- **200 OK** → Request succeeded  
- **201 Created** → Resource successfully created  

---

## 🔄 3xx — Redirection
- **301 Moved Permanently** → Resource moved to a new URL  
- **302 Found** → Temporary redirect  
- **304 Not Modified** → Cached version can be used  

---

## ⚠️ 4xx — Client Errors
- **400 Bad Request** → Invalid syntax in request  
- **401 Unauthorized** → Authentication required (not logged in / token missing)  
- **403 Forbidden** → You are logged in, but don’t have permission  
- **404 Not Found** → Resource doesn’t exist  
- **405 Method Not Allowed** → Wrong HTTP method used  

---

## ❌ 5xx — Server Errors
- **500 Internal Server Error** → Generic server crash/bug  
- **502 Bad Gateway** → Server got an invalid response from another server  
- **503 Service Unavailable** → Server temporarily down (maintenance/overload)  
- **504 Gateway Timeout** → Server took too long to respond  
