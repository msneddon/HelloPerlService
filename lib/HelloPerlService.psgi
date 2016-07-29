use HelloPerlService::HelloPerlServiceImpl;

use HelloPerlService::HelloPerlServiceServer;
use Plack::Middleware::CrossOrigin;



my @dispatch;

{
    my $obj = HelloPerlService::HelloPerlServiceImpl->new;
    push(@dispatch, 'HelloPerlService' => $obj);
}


my $server = HelloPerlService::HelloPerlServiceServer->new(instance_dispatch => { @dispatch },
				allow_get => 0,
			       );

my $handler = sub { $server->handle_input(@_) };

$handler = Plack::Middleware::CrossOrigin->wrap( $handler, origins => "*", headers => "*");
