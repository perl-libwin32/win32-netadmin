# NAME

Win32::NetAdmin - Manage network groups and users in Perl

# SYNOPSIS

```perl
use Win32::NetAdmin;
```

# DESCRIPTION

This module offers control over the administration of groups and users over a
network.

# FUNCTIONS

## NOTE

All of the functions return false if they fail, unless otherwise noted.
When a function fails call Win32::NetAdmin::GetError() rather than
GetLastError() or $^E to retrieve the error code.

`server` is optional for all the calls below. If not given the local machine is
assumed.

- GetError()

    Returns the error code of the last call to this module.

- GetDomainController(server, domain, returnedName)

    Returns the name of the domain controller for server.

- GetAnyDomainController(server, domain, returnedName)

    Returns the name of any domain controller for a domain that is directly trusted
    by the server.

- UserCreate(server, userName, password, passwordAge, privilege, homeDir, comment, flags, scriptPath)

    Creates a user on server with password, passwordAge, privilege, homeDir, comment,
    flags, and scriptPath.

- UserDelete(server, user)

    Deletes a user from server.

- UserGetAttributes(server, userName, password, passwordAge, privilege, homeDir, comment, flags, scriptPath)

    Gets password, passwordAge, privilege, homeDir, comment, flags, and scriptPath
    for user.

- UserSetAttributes(server, userName, password, passwordAge, privilege, homeDir, comment, flags, scriptPath)

    Sets password, passwordAge, privilege, homeDir, comment, flags, and scriptPath
    for user.

- UserChangePassword(domainname, username, oldpassword, newpassword)

    Changes a users password. Can be run under any account.

- UsersExist(server, userName)

    Checks if a user exists.

- GetUsers(server, filter, userRef)

    Fills userRef with user names if it is an array reference and with the user
    names and the full names if it is a hash reference.

- GroupCreate(server, group, comment)

    Creates a group.

- GroupDelete(server, group)

    Deletes a group.

- GroupGetAttributes(server, groupName, comment)

    Gets the comment.

- GroupSetAttributes(server, groupName, comment)

    Sets the comment.

- GroupAddUsers(server, groupName, users)

    Adds a user to a group.

- GroupDeleteUsers(server, groupName, users)

    Deletes a users from a group.

- GroupIsMember(server, groupName, user)

    Returns TRUE if user is a member of groupName.

- GroupGetMembers(server, groupName, userArrayRef)

    Fills userArrayRef with the members of groupName.

- LocalGroupCreate(server, group, comment)

    Creates a local group.

- LocalGroupDelete(server, group)

    Deletes a local group.

- LocalGroupGetAttributes(server, groupName, comment)

    Gets the comment.

- LocalGroupSetAttributes(server, groupName, comment)

    Sets the comment.

- LocalGroupIsMember(server, groupName, user)

    Returns TRUE if user is a member of groupName.

- LocalGroupGetMembers(server, groupName, userArrayRef)

    Fills userArrayRef with the members of groupName.

- LocalGroupGetMembersWithDomain(server, groupName, userRef)

    This function is similar LocalGroupGetMembers but accepts an array or
    a hash reference. Unlike LocalGroupGetMembers it returns each user name
    as `DOMAIN\USERNAME`. If a hash reference is given, the function
    returns to each user or group name the type (group, user, alias etc.).
    The possible types are as follows:

    ```
    $SidTypeUser = 1;
    $SidTypeGroup = 2;
    $SidTypeDomain = 3;
    $SidTypeAlias = 4;
    $SidTypeWellKnownGroup = 5;
    $SidTypeDeletedAccount = 6;
    $SidTypeInvalid = 7;
    $SidTypeUnknown = 8;
    ```

- LocalGroupAddUsers(server, groupName, users)

    Adds a user to a group.

- LocalGroupDeleteUsers(server, groupName, users)

    Deletes a users from a group.

- GetServers(server, domain, flags, serverRef)

    Gets an array of server names or an hash with the server names and the
    comments as seen in the Network Neighborhood or the server manager.
    For flags, see SV\_TYPE\_\* constants.

- GetTransports(server, transportRef)

    Enumerates the network transports of a computer. If transportRef is an array
    reference, it is filled with the transport names. If transportRef is a hash
    reference then a hash of hashes is filled with the data for the transports.

- LoggedOnUsers(server, userRef)

    Gets an array or hash with the users logged on at the specified computer. If
    userRef is a hash reference, the value is a semicolon separated string of
    username, logon domain and logon server.

- GetAliasFromRID(server, RID, returnedName)
- GetUserGroupFromRID(server, RID, returnedName)

    Retrieves the name of an alias (i.e local group) or a user group for a RID
    from the specified server. These functions can be used for example to get the
    account name for the administrator account if it is renamed or localized.

    Possible values for `RID`:

    ```
    DOMAIN_ALIAS_RID_ACCOUNT_OPS
    DOMAIN_ALIAS_RID_ADMINS
    DOMAIN_ALIAS_RID_BACKUP_OPS
    DOMAIN_ALIAS_RID_GUESTS
    DOMAIN_ALIAS_RID_POWER_USERS
    DOMAIN_ALIAS_RID_PRINT_OPS
    DOMAIN_ALIAS_RID_REPLICATOR
    DOMAIN_ALIAS_RID_SYSTEM_OPS
    DOMAIN_ALIAS_RID_USERS
    DOMAIN_GROUP_RID_ADMINS
    DOMAIN_GROUP_RID_GUESTS
    DOMAIN_GROUP_RID_USERS
    DOMAIN_USER_RID_ADMIN
    DOMAIN_USER_RID_GUEST
    ```

- GetServerDisks(server, arrayRef)

    Returns an array with the disk drives of the specified server. The array
    contains two-character strings (drive letter followed by a colon).

# EXAMPLE

```perl
# Simple script using Win32::NetAdmin to set the login script for
# all members of the NT group "Domain Users".  Only works if you
# run it on the PDC. (From Robert Spier <rspier@seas.upenn.edu>)
#
# FILTER_TEMP_DUPLICATE_ACCOUNTS
#   Enumerates local user account data on a domain controller.
#
# FILTER_NORMAL_ACCOUNT
#   Enumerates global user account data on a computer.
#
# FILTER_INTERDOMAIN_TRUST_ACCOUNT
#   Enumerates domain trust account data on a domain controller.
#
# FILTER_WORKSTATION_TRUST_ACCOUNT
#   Enumerates workstation or member server account data on a domain
#   controller.
#
# FILTER_SERVER_TRUST_ACCOUNT
#   Enumerates domain controller account data on a domain controller.


use Win32::NetAdmin qw(GetUsers GroupIsMember
           UserGetAttributes UserSetAttributes);

my %hash;
GetUsers("", FILTER_NORMAL_ACCOUNT , \%hash)
or die "GetUsers() failed: $^E";

foreach (keys %hash) {
my ($password, $passwordAge, $privilege,
    $homeDir, $comment, $flags, $scriptPath);
if (GroupIsMember("", "Domain Users", $_)) {
    print "Updating $_ ($hash{$_})\n";
    UserGetAttributes("", $_, $password, $passwordAge, $privilege,
              $homeDir, $comment, $flags, $scriptPath)
    or die "UserGetAttributes() failed: $^E";
    $scriptPath = "dnx_login.bat"; # this is the new login script
    UserSetAttributes("", $_, $password, $passwordAge, $privilege,
              $homeDir, $comment, $flags, $scriptPath)
    or die "UserSetAttributes() failed: $^E";
}
}
```

# LICENSE

This library is free software and may be distributed under the same terms
as perl itself.
