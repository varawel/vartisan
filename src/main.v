module main

import os
import cli
import vartisan

fn main() {
	mut cmd := cli.Command{
		name: 'vartisan'
		description: 'vartisan'
		execute: fn (cmd cli.Command) ! {
			vartisan.create_new()
			return
		}
	}

	mut new_cmd := cli.Command{
		name: 'new'
		description: 'create a new varawel project'
		usage: '<name>'
		required_args: 1
		execute: create_new_project
	}
	new_cmd.add_flag(cli.Flag{
		flag: .bool
		name: 'api'
		abbrev: 'a'
		description: 'rest full api '
	})

	cmd.add_command(new_cmd)

	cmd.setup()
	cmd.parse(os.args)
}


fn show_banner()
{
	println("banner")
}

fn create_new_project(cmd cli.Command)!
{
	name := cmd.args[0]
	println("new " + name)
	if cmd.flags.get_bool('api')!{
	println("api")

	}
	return
}
