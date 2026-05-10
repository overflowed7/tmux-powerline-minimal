# shellcheck shell=bash

run_segment() {
  tmux display-message -p '#[bold]#S#[nobold]:#I.#P'
  return 0
}
