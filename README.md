# Microsoft Entra ID: Employee Identity Lifecycle Lab

## Project Overview

This project demonstrates employee onboarding, a department transfer, and offboarding using Microsoft Entra ID Free in a personal lab environment.
I created a fictional employee, Alex Morgan, and managed his account and security group memberships as he joined Sales, transferred to Marketing, and left the organization. I then reviewed audit logs to verify the account-disabled and group-removal actions.

## Skills Demonstrated
- Creating and updating user accounts.
- Creating security groups and managing assigned membership.
- Removing outdated group membership during a department transfer.
- Disabling an account and performing session revocation during offboarding.
- Reviewing audit events and interpreting modified properties.

## Lab Scope

This lab used fictional information and manually assigned security groups. The groups were not connected to application permissions.
Manager and HR approvals were assumed as part of the scenario rather than processed through a ticketing system.

## Employee Onboarding

I started by creating Alex Morgan as the fictional employee. I set his department to Sales and the job title Sales Associate. I then created LAB-Sales as a security group with the membership type set to Assigned. I added Alex and verified he appeared in the group’s members list.

<img width="975" height="358" alt="image" src="https://github.com/user-attachments/assets/a5ebea7a-5dac-4c6e-b425-f1e71d0f5145" />

The screenshot above shows Alex is a member of LAB-Sales at this stage in the project.

## Employee Department Transfer

I created LAB-Marketing as a security group with Assigned membership. I changed Alex’s department to Marketing and job title to Marketing Associate. I added Alex to LAB-Marketing and verified his membership. I removed him from LAB-Sales and verified he was absent.

<img width="975" height="367" alt="image" src="https://github.com/user-attachments/assets/349e8750-ca86-4e1f-84e1-00e75fcb425a" />

The screenshot above demonstrates Alex is a member of LAB-Marketing.

<img width="975" height="363" alt="image" src="https://github.com/user-attachments/assets/4e4e2928-14e9-4a2d-97f5-0299d9ee4b24" />

This picture demonstrates that I removed Alex from LAB-Sales.

Removing outdated group memberships helps prevent membership accumulation as employees change roles.

## Employee Offboarding 

I had to disable Alex’s account when he left the company. I used Revoke sessions to invalidate his refresh tokens and require reauthentication. I removed Alex from LAB-Marketing and then verified he was absent from both lab groups.

<img width="1143" height="703" alt="04-account-disabled redact" src="https://github.com/user-attachments/assets/cd8259c0-4177-428c-a51b-70f07764bff1" />


This screenshot shows Alex’s account status is disabled.


<img width="975" height="352" alt="image" src="https://github.com/user-attachments/assets/60f2c5c2-ab55-4b3e-926c-795fcc3eb495" />

This screenshot shows Alex no longer belongs to either of the lab groups.

Overall, disabling the account blocks new sign-ins; removing group memberships prevents those memberships from restoring access if the account is later re-enabled. Session revocation doesn’t instantly end every application session.

## Audit Verification  

I reviewed Microsoft Entra audit logs to verify two offboarding actions: removing Alex from LAB-Marketing and disabling his account. For each event, I checked the activity, its status, the affected account, and the modified properties. 


<img width="874" height="324" alt="image" src="https://github.com/user-attachments/assets/beab3a6a-42f3-4db6-b777-497da581080c" />

 For the group-removal event, the activity tab showed “Remove member from group” with a Success status. The Target(s) tab identified Alex’s account. In Modified Properties, LAB-Marketing appeared under Old Value, while New Value was blank. Together, these details confirmed that Alex’s membership in LAB-Marketing had been removed.


 <img width="972" height="293" alt="image" src="https://github.com/user-attachments/assets/08127501-39d4-4711-8e9f-8607b329f83f" />

 For the account-disable event, the Activity tab showed “Disable account” with a Success status. The Modified Properties tab showed AccountEnabled changing from true to false. This recorded the change from an enabled account to a disabled account.  

 ## PowerShell User Reporting

I used Microsoft Graph PowerShell to retrieve Alex Morgan’s display name, department, job title, and account status. I exported these details to a CSV report and checked that they matched the Entra portal.

The script requests User.Read.All for read-only reporting. It prompts for the lab tenant ID, retrieves the account details, saves the report in Documents, and disconnects from Microsoft Graph.

- [View the PowerShell script](Export-EntraLabUserReport.ps1)
- [View the sample CSV report](Entra-Lab-User-Report.csv)

 ## Conclusion

 Overall, this review helped me distinguish between checking an account’s current state and verifying its change history. The account profile showed that Alex was disabled, while the audit logs recorded the actions taken during offboarding. These logs supported my verification of account disabling and group-membership removal; they did not demonstrate that every existing application session had ended. 






