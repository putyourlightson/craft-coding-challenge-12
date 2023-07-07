# Challenge #12 - Unravel the Fiesta Frenzy: Schedule the hottest summer spectacles!

## Description:
Calling all party planners! The summer party team is in a frenzy, and they need your expertise to bring order to the hottest summer spectacles of the year.

## Level: Medium

## Image:
![Fiesta-Frenzy](fiesta-frenzy-coding-challenge-12.jpg)

## Body
Attention, party aficionados! You've been summoned as the ultimate party planner expert to unravel the wild Fiesta Frenzy! The summer party team is in a tizzy, seeking your unbeatable talent for tropical festivities to craft the perfect schedule for the hottest summer spectacle of the year. Your mission, should you choose to accept it, is to bring order to the chaos by meticulously organizing and scheduling each event on the right date. Are you up for the challenge? Get ready to let the festivities begin! 

This [Git­Hub repo](https://github.com/putyourlightson/craft-coding-challenge-12) con­tains the Craft CMS site that you can spin up with a single com­mand, either loc­ally or in the browser using a Git­Hub Codespace (see the readme file in the repo).

Currently, the [index.twig](https://github.com/putyourlightson/craft-coding-challenge-12/blob/main/templates/index.twig) has 2 variables which both display the same event list. It is your task to ensure that the `futureEvents` only contains upcoming events, while the pastEvents variable contains the events that have already finished. Note that in the `index.twig` file, only the first date is parsed. Keep in mind the events can have more than one date!

## Rules

Your solution should consist of the events ordered in ascending order (`asc`) for upcoming events and in descending order (`desc`) for past events. This way, the events closest to the current date will appear at the top of the list.

- You may only edit the `templates/index.twig` template.
- You are allowed to override anything in tho `pastEvents` and `futureEvents` blocks.
- You can only use `collection` methods
- No Plugins or modules may be used except for the [Craft Closure](https://github.com/nystudio107/craft-closure) plugin. Which is already installed for you.
- Optimise your code for readability and maintainability (for the future you).

## Tips

Be clever about how you parse your dates inside the collection to simplify the sorting process.

## Bonus Points

Bonus points will be awarded to the extreme party aficionados who also manage to sort the parties by time!

## Acknowledgements
- Written by Michael Thomas
- Docker setup by Andrew Welch ([Spin Up Craft](https://github.com/nystudio107/spin-up-craft))
- Images by [Unsplash](https://unsplash.com/)