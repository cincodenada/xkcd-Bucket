# BUCKET PLUGIN

use BucketBase qw/config/;

my %table = (
    "!" => "\x{00A1}",
    '"' => "\x{201E}",
    "&" => "\x{214B}",
    "'" => "\x{002C}",
    '(' => ")",
    '[' => "]",
    '{' => "}",
    '<' => ">",
    '/' => "\\",
    '.' => "\x{02D9}",
    '3' => "\x{0190}",
    '4' => "\x{152D}",
    '6' => "\x{0039}",
    '7' => "\x{2C62}",
    ';' => "\x{061B}",
    '?' => "\x{00BF}",
    '_' => "\x{203E}",
    'a' => "\x{0250}",
    'b' => "\x{0071}",
    'c' => "\x{0254}",
    'd' => "\x{0070}",
    'e' => "\x{01DD}",
    'f' => "\x{025F}",
    'g' => "\x{0183}",
    'h' => "\x{0265}",
    'i' => "\x{0131}",
    'j' => "\x{027E}",
    'k' => "\x{029E}",
    'l' => "\x{0283}",
    'm' => "\x{026F}",
    'n' => "\x{0075}",
    'p' => "d",
    'q' => "b",
    'r' => "\x{0279}",
    't' => "\x{0287}",
    'u' => "n",
    'v' => "\x{028C}",
    'w' => "\x{028D}",
    'y' => "\x{028E}",
    'A' => "\x{2200}",
    'B' => "\x{10412}",
    'C' => "\x{2183}",
    'D' => "\x{25D6}",
    'E' => "\x{018E}",
    'F' => "\x{2132}",
    'G' => "\x{2141}",
    'J' => "\x{017F}",
    'K' => "\x{22CA}",
    'L' => "\x{2142}",
    'M' => "\x{0057}",
    'N' => "\x{1D0E}",
    'P' => "\x{0500}",
    'Q' => "\x{038C}",
    'R' => "\x{1D1A}",
    'T' => "\x{22A5}",
    'U' => "\x{2229}",
    'V' => "\x{1D27}",
    'Y' => "\x{2144}",
);

# auto reverse the flip
foreach (keys %table) {
    next if exists $table{$table{$_}};
    $table{$table{$_}} = $_;
}

sub signals {
    return (qw/say do/);
}

sub route {
    my ( $package, $sig, $data ) = @_;

    if ($data->{chl} ne &config("logchannel")) {
        $data->{text} = join "", reverse map { $table{$_} || $_ } split //, lc $data->{text};
    }

    return 0;
}
