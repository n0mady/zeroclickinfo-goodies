package DDG::Goodie::Zodiac;
#ABSTRACT : Find the Zodiac Sign by feeding Date as Input

use DDG::Goodie;
with 'DDG::GoodieRole::Dates';

#My Imports
use strict;
use warnings;

#Import the DateTime::Event::Zodiac Module
use DateTime::Event::Zodiac qw(zodiac_date_name);

zci answer_type => "zodiac";

triggers startend => "zodiac","zodiac sign","starsign","star sign";

#File MetaData
primary_example_queries "zodiac 21st June";
secondary_example_queries "31 Dec starsign","1st Jan 1981 star sign","zodiac sign 1 Nov";
description	"Find the Zodiac Sign for the Respective Date given as Input based on Tropical Zodiac(2011) Source : https://en.wikipedia.org/wiki/Zodiac";
name "zodiac";
category "dates";
topics "special_interest";
attribution email  => 'nomady@zoho.com',
            github => ['https://github.com/n0mady','NOMADY'];

handle remainder => sub {

    my $datestring = $_;    # The remainder should just be the string for their date.

    #Parse the Given Date String
    my $zodiacdate = parse_datestring_to_date($datestring);

    #Return Nothing if the User Provided Date is Invalid
    return unless $zodiacdate;

    #Return the Star Sign
    my $result="Star Sign for ".date_output_string($zodiacdate).": ".ucfirst(zodiac_date_name($zodiacdate));

	#Input String
    my $input=date_output_string($zodiacdate).": ";
    
    return $result,
    structured_answer => {
    input	=> [html_enc($input)],
    operation => 'Star Sign for ',
    result	=> html_enc(ucfirst(zodiac_date_name($zodiacdate)))
    };
};

1;
