#!/usr/bin/env Rscript
# Purpose:
#     Generate the Fibonacci Sequence or the
#     value at a given position in the sequence
#
# function call:
#     ./produce_fibonacci_sequence.r {{--sequence='numeric'}}
#         {{--number='numeric'}}
#
#     example calls:
#         ./produce_fibonacci_sequence.r --sequence=4
#         ./produce_fibonacci_sequence.r --number=5

# Import Libraries
library("optparse")
library('stringr')


###
# Declare Methods
###

get_fibonacci_number = function(x) {

    if (x <= 1) {
        return(x)
    }

    return(get_fibonacci_number(x - 2) + get_fibonacci_number(x - 1))
}

get_fibonacci_sequence = function(x) {

    fibonacci_sequence = c()
    for (i in 1:x) {
      fibonacci_sequence = c(fibonacci_sequence, get_fibonacci_number(i))
    }

    return(fibonacci_sequence)
}

###
# Main Execution
###

option_list = list(
    make_option(
        c("-s", "--sequence"), type="numeric", default=NULL,
        help="Length of Fibonacci Sequence To Return", metavar="numeric"),
    make_option(
        c("-n", "--number"), type="numeric", default=NULL,
        help="Number in Fibonacci Sequence To Return", metavar="numeric")
)
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$sequence) & is.null(opt$number)) {
    sprintf("Need to Provide --sequence or --number")
}

if (!is.null(opt$sequence)) {
    sprintf(
        "Fibonacci Sequence for %s: %s",
        opt$sequence,
        str_c(
            get_fibonacci_sequence(opt$sequence),
            collapse=', '
        )
    )
}

if (!is.null(opt$number)) {
    sprintf(
        "Fibonacci Value for %s: %s",
        opt$number,
        get_fibonacci_number(opt$number)
    )
}
