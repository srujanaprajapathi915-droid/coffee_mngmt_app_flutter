# ☕ Coffee Management Web - Flutter

A modern, responsive Coffee Shop Management System built with Flutter Web. Designed for cafe owners to manage orders, menu, inventory and sales in one dashboard - like a real product.

## 🚀 Features (Product Level)

- **Dashboard Analytics:** Daily sales, total orders, revenue charts
- **Menu Management:** Add / Edit / Delete coffee items with price & category
- **Order Management:** Live order tracking (Pending, Preparing, Completed)
- **Inventory Tracking:** Auto stock deduction on order
- **Responsive UI:** Works on Desktop, Tablet & Mobile
- **Clean Architecture:** Separation of UI, Logic & Data

## 🛠️ Tech Stack

- **Framework:** Flutter 3.x (Web)
- **Language:** Dart
- **State Management:** Provider / Riverpod
- **Backend (Mock):** Firebase / Local JSON
- **UI:** Material 3, Responsive Layout, Custom Widgets



## 📂 Project Structure

lib/
├── screens/ (dashboard, orders, menu)
├── widgets/ (coffee_card, order_tile)
├── models/ (coffee_model, order_model)
├── providers/ (state management)
└── services/ (api / firebase)

## ⚙️ How to Run

```bash
# Clone the repo
git clone https://github.com/rekha321-S/Coffee_Management_Web_Flutter

# Get packages
flutter pub get

# Run on web
flutter run -d chrome
