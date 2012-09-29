my $ans = 2;
my $count = 1;
my $times = 10000;

for (my $i = 3; $count < $times; $i += 2) {
    my $check = 0;
    my $stop = sqrt $i;
    for (my $j = 3; $j <= $stop; $j += 2) {
        if ($i % $j == 0) {
            $check = 1;
            last;
        }
    }
    if ($check == 0) {
        $ans += $i;
        $count++;
    }
}
print "ans = $ans\n";

