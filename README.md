# NixOS-Rice

This rice ~~uses~~ does **NOT** use [den](https://github.com/denful/den)
(nothing against the project, I just couldn't use it reliably)


### TODO LIST:
- [ ] systemd hardening
  - [ ] ProtectSystem
  - [ ] ProtectHome
  - [ ] PrivateTmp
  - [ ] NoNewPrivileges
- [ ] sudo restrictions
- [ ] fail2ban
- [ ] usbguard
- [ ] sops-nix (secrets management)
  - [ ] automatic
  - [ ] manual
- [ ] auditd
- [ ] java integration (full dev environment)
  - [ ] java docs
  - [ ] cli runner (with System.in tracking)
- [ ] custom image
- [x] plymouth (boot screens)
- [ ] disko integration (alongside NixOS fileSystems)
  - [ ] disko
  - [ ] fileSystems
- [ ] satty (screenshot editing)
- [x] mako (notification daemon)
  - [x] theme module integration
