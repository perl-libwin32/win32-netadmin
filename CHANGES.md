# Revision history for Perl extension Win32::NetAdmin

## 0.14 [2026-05-04]

- Fix memory leak in LocalGroupIsMember by [@ms-rs](https://github.com/ms-rs) [#8](https://github.com/perl-libwin32/win32-netadmin/pull/8)
- Restore early-exit and tab indentation in LocalGroupIsMember loop [#13](https://github.com/perl-libwin32/win32-netadmin/pull/13)
- Fix Cygwin g++ build of Net*Enum resume-handle arguments [#12](https://github.com/perl-libwin32/win32-netadmin/pull/12)
- Improve test reliability on Windows Server by Florian Manschwetus ([@manschwetusCF](https://github.com/manschwetusCF)) [#6](https://github.com/perl-libwin32/win32-netadmin/pull/6)
- Move repository to perl-libwin32 organization [#10](https://github.com/perl-libwin32/win32-netadmin/pull/10)
- Add LICENSE and README.md [#14](https://github.com/perl-libwin32/win32-netadmin/pull/14)

## 0.13 [2014-10-21]

- Change resumeHandle variable type to DWORD_PTR
  (thanks to Mark J Hewitt) [#5](https://github.com/perl-libwin32/win32-netadmin/pull/5) [rt#99461]
  [https://bugs.activestate.com/show_bug.cgi?id=100108]

## 0.12 [2013-11-28]

- Fix required perl version 5.6 -> 5.006.
- Add Github repo link to META.yml
- Typo fixes by David Steinbrunner
- Add LICENSE section to pod [rt#41181]

## 0.11 [2008-07-02]

- Skip tests when running on Windows 95.

## 0.10 [2008-06-23]

- Skip tests when not running as an administrator.

## 0.09 [2008-04-15]

- version 0.09 for separate upload to CPAN
- updated email addresses
- simplified Makefile.PL
- added META.yml
- added ppport.h

## 0.08 [2000-05-22]

- move last error variable to interpreter (thanks to
  Doug Lankshear)

## 0.07 [2000-05-22]

- support for passing Unicode strings to methods (thanks to
  Doug Lankshear)

## 0.062 [1999-08-04]

- added docs to EXAMPLE

## 0.061 [unreleased]

- added a NetAdmin example from Robert Spier.
- minor changes for Perl 5.005xx compatibility

## 0.06 [1998-09-07]

- fixed GPF in LocalGroupIsMember()

## 0.05 [1998-05-10]

- removed broken #ifdefs that disabled UserChangePassword() and
  other functions
- fix broken constants and add new ones (courtesy Dave Roth)
- export :ALL functions (courtesy Tye McQueen)
- New functions GetAliasFromRID(), GetUserGroupFromRID(), and
  GetServerDisks(). LocalGroupGetMembersWithDomain() fixes
  (courtesy Jutta M. Klebe)

## 0.04 [unreleased]

- added LocalGroupGetMembersWithDomain() via
  David Gardiner

## 0.03 [1998-02-06]

- fixes and enhancements courtesy Jutta Klebe
  * New functions: LoggedOnUsers(), GetTransports()
  * GetUsers() and GetServers() now accept hashrefs
- misc. pod fixes

## 0.02 [1997-12-13]

- Fixes for enumeration functions from Joe Doss
- Various tweaks to the fixes
- Added changes in ActiveState version

## 0.01 [1997-04-05]

- original version; created by h2xs 1.18
- imported ActiveWare version

