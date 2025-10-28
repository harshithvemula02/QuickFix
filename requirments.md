## QuickFix Flutter App - Requirements Document

### 1. Project Overview

**Project Name:** QuickFix
**Purpose:** QuickFix is a cross-platform Flutter app designed to help users find local workers for small home issues such as plumbing, electrical work, catering, labour, and more. The goal is to provide a simple, intuitive, and efficient interface to showcase services and provide contact information without requiring login functionality for the MVP.

**Target Platforms:** Web (Chrome/Edge), Desktop (Windows via Flutter, optional), Mobile (future enhancement)

**Technology Stack:** Flutter, Dart (no backend/Firebase for MVP)

---

### 2. Features

#### 2.1 Main Structure

* **Splash Screen**

  * Fullscreen app logo/name
  * Duration: 2–3 seconds
  * Navigate automatically to Home tab

* **Bottom Navigation Bar with 5 Tabs:**

  1. Home
  2. Services
  3. About & Contact
  4. Notifications
  5. Gallery / Portfolio

#### 2.2 Home Tab

* Landing page with welcome message
* Brief introduction about QuickFix
* Optional: highlight popular services

#### 2.3 Services Tab

* Display cards/list for available services:

  * Plumber
  * Electrician
  * Carpenter
  * Painter
  * Cleaning / Housekeeping
  * Catering / Food
  * Labour / General Help
  * AC / Appliance Repair
* Each service card includes:

  * Icon / Image
  * Service Name
  * Short Description

#### 2.4 About & Contact Tab

* **Project Details:**

  * App name and purpose
  * Key features and objectives
* **Team Members:**

  * Harshith - CEO
  * Ajay - CMO
  * Vamshi - CTO
  * Each member has:

    * Photo
    * Name
    * Role / Designation
* **Contact Form:**

  * Input fields: Name, Email, Message
  * Submit button (for now prints to console)
  * Optional display of college/project email and phone number

#### 2.5 Notifications Tab

* Scrollable list of static announcements or updates
* Sample items for MVP
* Optional: future integration with dynamic notifications

#### 2.6 Gallery / Portfolio Tab

* Display images of previous work, worker portfolios, or illustrative service images
* Grid/List layout
* Enhances trust and app professionalism

---

### 3. UI/UX Guidelines

* Clean, minimalistic, and easy-to-navigate design
* Reusable widgets for cards, buttons, and lists
* Scrollable screens for About, Services, and Notifications tabs
* Responsive layout for web and desktop
* Splash screen transitions smoothly into Home tab

---

### 4. Project Structure (Flutter)

```
lib/
 ├─ main.dart                # Entry point
 ├─ screens/
 │    ├─ splash_screen.dart
 │    ├─ home_screen.dart
 │    ├─ services_screen.dart
 │    ├─ about_contact_screen.dart
 │    ├─ notifications_screen.dart
 │    └─ gallery_screen.dart
 ├─ widgets/
 │    └─ common_widgets.dart  # Reusable cards, buttons, tiles
 └─ models/
      └─ team_member.dart     # Optional, for About tab
```

---

### 5. Notes / Considerations

* MVP **does not require login or backend integration**
* All data (services, team members, notifications) can be hardcoded or stored locally
* Firebase or backend integration can be added later for dynamic content, bookings, or notifications
* App should be **ready-to-run in VS Code** for Flutter Web

---

### 6. Future Enhancements

* Login/Signup functionality (Firebase Authentication)
* Booking system for services
* Real-time notifications (Firebase Cloud Messaging)
* Location-based services / map integration
* Payment integration (Razorpay, Stripe)
* Android and iOS mobile support
* Windows desktop support via Visual Studio setup

---

**Prepared For:** QuickFix Project Documentation
**Prepared By:** Harshith Vemula
**Date:** 11-Oct-2025
