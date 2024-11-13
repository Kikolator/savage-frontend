import 'package:savage_client/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TermsAndConditionsViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  late String _version;
  String get version => _version;

  late String _termsAndConditions;
  String get termsAndConditions => _termsAndConditions;

  Future<void> getData() async {
    try {
      setBusy(true);
      // TODO get data from db
      _version = '0.1';
      _termsAndConditions = '''
_Last Updated: 12 November 2024_

Welcome to Savage Coworking (the "Space"). These Terms and Conditions ("Terms") govern your access to and use of our coworking facilities, services, and mobile application (the "App"). By accessing or using the Space and the App, you agree to comply with and be bound by these Terms.

---

### 1. **Coworking Space Provider**

- The Space is operated by **Savage Coworking**, located at **Av. España 230, Estepona, Spain**.
- References to "we," "us," or "the Provider" pertain to **Savage Coworking**.

### 2. **Use of Space and Conduct**

- **Responsible Use**: You agree to use the Space in a responsible and respectful manner, preserving the environment for all members.
- **Prohibited Behavior**: Disruptive, offensive, or inappropriate conduct is not allowed and may result in termination of access.
- **Compliance**: You must adhere to all applicable laws, regulations, and our internal policies while on the premises.

### 3. **Personal Access Code Responsibility**

- **Access Code Security**: Upon registration, you will receive a personal access code for entry to the Space.
- **Confidentiality**: You are responsible for keeping your access code confidential and secure.
- **Unauthorized Use**: Sharing your access code is strictly prohibited and may lead to suspension or termination of your membership.

### 4. **Wi-Fi and Internet Usage**

- **Provided Services**: We offer Wi-Fi and internet access for your convenience.
- **Lawful Use**: Internet services must be used lawfully. Any form of illegal activity is strictly forbidden.
- **Monitoring**: We reserve the right to monitor network usage to ensure compliance with these Terms.

### 5. **Bookings and Payments**

- **App Transactions**: All bookings and payments are processed through the App.
- **Modifications and Cancellations**: We reserve the right to change, modify, or revoke any bookings or payments made via the App at our discretion.
- **Notifications**: In case of any changes, we will attempt to notify you promptly through the App or via email.

### 6. **Security and Liability**

- **Personal Belongings**: We are not responsible for theft, loss, or damage to your personal items.
- **Valuables**: Please secure your valuables. Lockers may be provided but are used at your own risk.
- **Assumption of Risk**: By using the Space, you assume all risks of loss or damage to your property.

### 7. **Guests and Visitors**

- **Guest Policy**: You may bring guests or visitors into the Space with prior approval.
- **Responsibility**: You are accountable for the behavior of your guests and must ensure they comply with these Terms.
- **Limitations**: The number of guests may be limited, and additional fees may apply.

### 8. **Privacy and Confidentiality**

- **Respect for Others**: Do not disclose or misuse any confidential or personal information obtained from other members.
- **Data Protection**: We are committed to protecting your privacy in accordance with our Privacy Policy, available in the App.
- **Confidential Discussions**: Be mindful of sensitive conversations in shared areas.

### 9. **Property Damage and Maintenance**

- **Damage Responsibility**: You will be held responsible for any damage you cause to the Space, including furniture and equipment.
- **Reporting Issues**: Report any damages or maintenance needs promptly through the App or to staff.
- **Repair Costs**: You may be charged for repair or replacement costs resulting from damages caused by you.

### 10. **Code of Conduct and Community Guidelines**

- **Professional Environment**: Maintain a professional demeanor at all times.
- **Respectful Interaction**: Treat all members, guests, and staff with respect and courtesy.
- **Prohibited Actions**: Harassment, discrimination, and any form of abusive behavior are strictly prohibited.

### 11. **Dispute Resolution**

- **Initial Resolution**: Attempt to resolve any disputes or issues informally by contacting us through the App or customer service.
- **Mediation**: If a dispute cannot be resolved informally, parties may agree to mediation before pursuing legal action.
- **Legal Proceedings**: Any unresolved disputes will be handled in accordance with the governing law specified below.

### 12. **Force Majeure**

- **Uncontrollable Events**: We are not liable for any failure to perform due to causes beyond our reasonable control, such as natural disasters, war, or governmental actions.
- **Notification**: We will notify you of any such events affecting our services as soon as reasonably possible.

### 13. **Governing Law**

- **Jurisdiction**: These Terms are governed by the laws of **Andalucia, Spain**.
- **Venue**: Any legal actions will be brought exclusively in the courts located within **Estepona, Spain**.

### 14. **Amendments**

- **Right to Modify**: We reserve the right to update or modify these Terms at any time.
- **Effective Date**: Changes will become effective upon being posted in the App or at the Space.
- **Continued Use**: Your continued use of the Space and the App after changes are made signifies your acceptance of the new Terms.

### 15. **Severability**

- **Invalid Provisions**: If any provision of these Terms is found to be unenforceable or invalid, the remaining provisions shall remain in full effect.

### 16. **Entire Agreement**

- **Complete Terms**: These Terms constitute the entire agreement between you and us regarding the use of the Space and the App.

### 17. **Contact Information**

- **Questions and Support**: For any questions or concerns, please contact us through the App or at **hub@savage-coworking.com**.

---

**Acceptance of Terms**

By accessing or using our coworking Space and App, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.

---

*Thank you for choosing Savage Coworking. We are excited to have you as part of our community!*''';
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }

  void acceptTerms() {
    _routerService.back(result: true);
  }
}
