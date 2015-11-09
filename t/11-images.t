#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

my $boss = require 't/prologue.pl';

is $boss->http_response, undef;

my $search = $boss->Images( q => 'sushi' );
isa_ok( $search, 'WebService::Yahoo::BOSS::Response' );
isa_ok( $search->results->[0], 'WebService::Yahoo::BOSS::Response::Images');

ok $boss->http_response;
is $boss->http_response->code, 200;

done_testing();
