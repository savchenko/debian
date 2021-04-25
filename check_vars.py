#
# Quick mashup, use at your own risk.
#
# TODO:
#   - [ ] Check variable types
#   - [ ] Check Readme

import yaml
import os
import argparse

parser = argparse.ArgumentParser(description='Checks if role variables are declared in a Playbook')
parser.add_argument('--role', '-f', default='', help="Path to the role directory")
parser.add_argument('--playbook', '-b', default='', help="Path to the playbook YAML file")
parser.add_argument('--debug', '-d', default=False, help="Enable debug output")
args = parser.parse_args()

if os.path.isdir(args.role):
    role = os.path.basename(os.path.normpath(args.role))
if os.path.isfile(args.playbook):
    pbook = os.path.basename(os.path.normpath(args.playbook))
if args.debug:
    dbg = True

with open(args.playbook, 'r') as pbook_yaml:
    pbook_yaml_parsed = yaml.safe_load(pbook_yaml)
    pbook_data = {}
    for x in pbook_yaml_parsed[0]['tasks']:
        pbook_data[x['include_role']['name']] = x['vars']

role_vars = pbook_data[role]

f_to_check = []
for root, dirs, files in os.walk(args.role):
    root_base = os.path.basename(os.path.normpath(root))
    if root_base in ('vars', 'defaults'):
        for f in files:
            f_to_check.append(os.path.join(root, f))

collected_vars = {
    'vars': [], 'defaults': []
}

for f in f_to_check:
    if os.path.basename(os.path.abspath(os.path.join(f, os.pardir))) == 'vars':
        f_type = 'vars'
    elif os.path.basename(os.path.abspath(os.path.join(f, os.pardir))) == 'defaults':
        f_type = 'defaults'
    else:
        raise Exception(1)
    with open(f, 'r') as f_yaml:
        for x in yaml.safe_load(f_yaml):
            collected_vars[f_type].append(x)

declared_defaults = [x for x in collected_vars['defaults'] if x in role_vars]

if declared_defaults:
    print('''
    Role attempts to override default variable(s).
    Do not do this; their values are set during PB run.
    Affected variables:
    ''')
    for x in declared_defaults:
        print('\t', x)

undeclared_vars = [x for x in collected_vars['vars'] if x not in role_vars]

if undeclared_vars:
    print('''
    These are variables present in "%s" role, but missing in %s:
    ''' % (role, pbook))
    for x in undeclared_vars:
        print('\t', x)
