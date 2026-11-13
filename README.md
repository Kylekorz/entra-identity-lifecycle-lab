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

This lab used fictional information and manually assigned security groups. The groups were not connected to application permission.
Manager and HR approvals were assumed as part of the scenario rather than processed through a ticketing system.

## Employee Onboarding

I started by creating Alex Morgan as the fictional employee. I set his department to Sales and the job title Sales Associate. I then created LAB-Sales as a security group with the membership type set to Assigned. I added Alex and verified he appeared in the group’s members list.

<img width="975" height="358" alt="image" src="https://github.com/user-attachments/assets/a5ebea7a-5dac-4c6e-b425-f1e71d0f5145" />

The screenshot above shows Alex is a member of LAB-Sales at this stage in the project.
