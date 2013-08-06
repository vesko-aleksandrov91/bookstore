#! /usr/bin/perl

use strict;
use warnings;
use DBI;
use Digest::SHA qw(sha1_hex);

#connect to database
my $dbh = DBI->connect('DBI:SQLite:book_shop.db') or die print "Couldn't connect to selected database!";
my $sth = $dbh->prepare('INSERT INTO ROLES (ID, NAME) VALUES (?, ?)');
$sth->execute(1, 'Admin');
$sth->execute(2, 'Customer');

#test for sha algorythm
my $password = "vesko";
my $hash_pass = sha1_hex($password);

$sth = $dbh->prepare('INSERT INTO USERS (LOGIN_NAME, LOGIN_PASS, REAL_NAME, PHONE, ROLE_ID)
		VALUES ("admin", ?, "Veselin", "0883459496", 1)');
$sth->execute($hash_pass);

$dbh->disconnect();
