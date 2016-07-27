#!/usr/bin/python3

"""
Checkout target repo with branch noted as cross-request dependency for a given
pull request of the source repo.
"""

import github3
import os
import re
import subprocess
import sys


# Repo PR -> String
def get_cross_branch(target_repo, source_pr):
    """
    Get target repo branch name that was labeled as cross-requested in source
    pull request.
    """
    url = "{}/pull/(\d+)".format(target_repo.html_url)
    search_pattern = "[Cc]ross-?(request)?:?(\s?){}".format(url)
    cross_request_search = re.search(search_pattern, source_pr.body)

    if cross_request_search:
        pr_number = cross_request_search.group(3)
        branch_name = target_repo.pull_request(pr_number).head.ref
        return branch_name
    else:
        return source_pr.base.ref


# String Integer String String -> None
def checkout_pr_branch(local_parent_dir, pr_number,
                       source_repo_name, target_repo_name):
    os.chdir(local_parent_dir)
    src_repo = github3.repository('dimagi', source_repo_name)
    target_repo = github3.repository('dimagi', target_repo_name)

    src_pr = src_repo.pull_request(pr_number)
    checkout_branch(src_repo.name, src_pr.head.ref)
    cross_branch = get_cross_branch(target_repo, src_pr)

    if not os.path.exists(target_repo.name):
        print("Checking out {} for {}".format(cross_branch, target_repo_name))
        subprocess.call('git clone {}'.format(target_repo.clone_url),
                        shell=True)

    checkout_branch(target_repo.name, cross_branch)
    os.chdir(local_parent_dir)


# String String -> None
def checkout_branch(repo_name, branch):
    os.chdir(repo_name)
    subprocess.call('git checkout {}'.format(branch), shell=True)
    subprocess.call('git pull', shell=True)
    os.chdir("../")


def main():
    if len(sys.argv) < 4:
        print("Command arg format: [source repo] [PR number]" +
              " [target repo] [OPTIONAL root dir]")
        sys.exit()

    source_repo_name = sys.argv[1]
    pr_number = int(sys.argv[2])
    target_repo_name = sys.argv[3]

    root_dir = "."
    if len(sys.argv) == 5:
        root_dir = sys.argv[4]
    root_dir = os.path.abspath(root_dir)

    checkout_pr_branch(root_dir, pr_number, source_repo_name, target_repo_name)


if __name__ == "__main__":
    main()
