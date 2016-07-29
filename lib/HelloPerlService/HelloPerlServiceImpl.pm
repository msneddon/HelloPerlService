package HelloPerlService::HelloPerlServiceImpl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org 
our $VERSION = "0.0.1";
our $GIT_URL = "";
our $GIT_COMMIT_HASH = "";

=head1 NAME

HelloPerlService

=head1 DESCRIPTION

A KBase module: HelloPerlService

=cut

#BEGIN_HEADER
#END_HEADER

sub new
{
    my($class, @args) = @_;
    my $self = {
    };
    bless $self, $class;
    #BEGIN_CONSTRUCTOR
    #END_CONSTRUCTOR

    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}

=head1 METHODS



=head2 hello

  $response = $obj->hello($message)

=over 4

=item Parameter and return types

=begin html

<pre>
$message is a string
$response is a string

</pre>

=end html

=begin text

$message is a string
$response is a string


=end text



=item Description

Insert your typespec information here.

=back

=cut

sub hello
{
    my $self = shift;
    my($message) = @_;

    my @_bad_arguments;
    (!ref($message)) or push(@_bad_arguments, "Invalid type for argument \"message\" (value was \"$message\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to hello:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'hello');
    }

    my $ctx = $HelloPerlService::HelloPerlServiceServer::CallContext;
    my($response);
    #BEGIN hello

    $response = "Howdy.  You said: ".$message;

    #END hello
    my @_bad_returns;
    (!ref($response)) or push(@_bad_returns, "Invalid type for return variable \"response\" (value was \"$response\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to hello:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'hello');
    }
    return($response);
}




=head2 status 

  $return = $obj->status()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a string
</pre>

=end html

=begin text

$return is a string

=end text

=item Description

Return the module status. This is a structure including Semantic Versioning number, state and git info.

=back

=cut

sub status {
    my($return);
    #BEGIN_STATUS
    $return = {"state" => "OK", "message" => "", "version" => $VERSION,
               "git_url" => $GIT_URL, "git_commit_hash" => $GIT_COMMIT_HASH};
    #END_STATUS
    return($return);
}

=head1 TYPES



=cut

1;
