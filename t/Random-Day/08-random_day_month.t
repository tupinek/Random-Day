# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use Error::Pure::Utils qw(clean);
use Random::Day;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Test.
my $obj = Random::Day->new;
my $ret = $obj->random_day_month(10, 10);
isa_ok($ret, 'DateTime');
like($ret, qr{^\d\d\d\d-10-10T00:00:00$}, 'Random date from day and month.');

# Test.
eval {
	$obj->random_day_month(40, 10);
};
is($EVAL_ERROR, "Cannot create DateTime object.\n",
	'Cannot create DateTime object.');
clean();

# Test.
eval {
	$obj->random_day_month(10, 40);
};
is($EVAL_ERROR, "Cannot create DateTime object.\n",
	'Cannot create DateTime object.');
clean();
