# Ansible Automation Lab

This repository contains Ansible playbooks and configurations designed to simulate a small production-style automation environment.

## Purpose

The goal of this project is to demonstrate infrastructure automation, configuration management, and systems thinking across Windows and Linux environments.

## Structure

- inventory/ → Hosts definition
- playbooks/ → Automation tasks
- roles/ → Reusable configuration roles
- docs/ → Documentation and design notes

## Example Use Cases

- Linux baseline configuration
- Windows system preparation
- Package installation and standardisation
- Future integration with Active Directory and enterprise systems

## Design Philosophy

This project is structured to reflect production-like automation practices:
- Separation of inventory and logic
- Reusable playbook design
- Scalable role-based structure
- Clear documentation for maintainability

## Future Improvements

- Integration with AWX / Ansible Automation Platform
- Git-based CI/CD execution
- Secrets management using Ansible Vault
- Expanded Windows automation (AD, GPO baseline)
