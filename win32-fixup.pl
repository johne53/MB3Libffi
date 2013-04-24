#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'doc/version.texi'

require "../local-paths.lib";

$package_string = "\"libffi 3.0.13\"";
$package_version = "\"3.0.13\"";
$ffi_version = "3.0.13";
$major = 3;
$minor = 0;
$micro = 13;
$interface_age = 0;
$have_long_double = 1;
$ffi_exec_trampoline_table = 0;
$ffi_target = "X86_WIN32";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@FFI_MAJOR_VERSION\@/$major/g;
	    s/\@FFI_MINOR_VERSION\@/$minor/g;
	    s/\@FFI_MICRO_VERSION\@/$micro/g;
	    s/\@FFI_INTERFACE_AGE\@/$interface_age/g;
	    s/\@FFI_EXEC_TRAMPOLINE_TABLE\@/$ffi_exec_trampoline_table/g;
	    s/\@HAVE_LONG_DOUBLE\@/$have_long_double/g;
	    s/\@PACKAGE_STRING@/$package_string/g;
	    s/\@PACKAGE_VERSION@/$package_version/g;
	    s/\@VERSION@/$package_version/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@TARGET\@/$ffi_target/g;
	    print OUTPUT;
	}
}

process_file ("fficonfig.h");
process_file ("include/ffi.h");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("ffi.vsprops");
	process_file ("msvc/ffi/ffi.rc");
}