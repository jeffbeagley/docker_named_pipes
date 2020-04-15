const inquirer = require('inquirer')
const program = require('commander')
const execSh = require('exec-sh')

program.command('ps').action(() => {
	out = execSh(`./pipe_writer.sh docker ps`)
})

program.command('ls').action(() => {
	out = execSh(`./pipe_writer.sh ls -lh`)
})

program.command('question').action(() => {
		inquirer
			.prompt([
				{
					type: 'list',
					name: 'env',
					message: 'Select an option?',
					choices: [
						{
							name: `test 1`,
							value: '1'
						},
						{
							name: 'test 2',
							value: '2'
						}
					]
				}
			])
			.then((answers) => {
				out = execSh(`./pipe_writer.sh docker ps`, true)
			})
})

program.on('command:*', function () {
	console.error('Invalid command: %s\nSee --help for a list of available commands.', program.args.join(' '))
	process.exit(1)
})

program.parse(process.argv)
