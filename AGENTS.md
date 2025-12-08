# Agent Guidelines for fun-o

## Overview
fun-o is a Prolog module collection for phonological analysis, currently supporting French. All code is written in SWI-Prolog.

## Testing & Running

- **Run tests**: `swipl -g "run_tests(sonority_tests)" tests/sonority_tests.pl`
- **Run single test**: `swipl -g "run_tests(sonority_tests:NAME)" tests/sonority_tests.pl`
- **Interactive mode**: `swipl fun-o.pl`
- **Check syntax**: `swipl -g "compile(filename), halt" filename.pl`

## Code Style

### Imports & Modules
- Use relative paths with `:-` directives: `['../utils/init']`
- Import phonemes, utils, and logic modules at top of file
- Module system is commented out (`:- module(...)` not in use)

### Formatting
- Use lowercase predicates: `sonority(X)`, `attack_order(Y)`
- Use consistent indentation (visible from code: 8 spaces for nested rules)
- Add comment headers explaining purpose: `% Brief description of what follows`

### Naming Conventions
- **Predicates**: snake_case (`find_nucleus`, `split_syllable`)
- **Facts**: declare at top with clear semantics (`principle(plosive, 1)`)
- **Variables**: CamelCase (`Syl`, `Nucleus`, `Coda`, `TAttack`)

### Error Handling
- Use cut (`!`) to control backtracking when needed
- Use `dif/2` constraint for inequality checks
- Validate input through goal failures (tests use `fail/condition` patterns)

### Phonological Semantics
- Represent syllable structure: attack, nucleus, coda
- Use trait-based classification: `plosive`, `fricative`, `nasal`, `liquid`, `glide`, `vowel`
- Strings: set `double_quotes` flag to `chars` in init.pl

### Testing
- Place tests in `tests/` directory with `_tests.pl` suffix
- Use SWI-Prolog's `plunit` framework: `begin_tests/1`, `end_tests/1`
- Test names describe syllable patterns: `cv`, `ccvc`, `cvc`
- Use `[condition(true), fail]` and `[fail, condition(true)]` options

## File Organization
- **logic/**: Core phonological logic (sonority, syllables, transcription)
- **dict/**: Phoneme definitions and DCG rules
- **utils/**: Utility functions and initialization
- **tests/**: Test files using plunit framework

## Known Issues & Areas for Improvement

### Critical Issues
1. **Syllable structure is over-specified**: `syllable/1` has redundant clauses that create ambiguity. Consolidate Attack and Rime as optional components.
2. **Phoneme representation is fragmented**: Two incompatible representations exist—`phonemes.pl` (simple traits) vs `phonemes_dcg.pl` (detailed features). Unify them.
3. **`split_syllable/4` allows multiple nuclei**: No validation that exactly one nucleus exists. Can incorrectly split `[a,e,i]` into multiple nuclei.
4. **Weak constraint logic**: Using `dif/2` with `=<` is fragile when variables are unbound. Prefer explicit inequality `\=`.
5. **Incomplete feature representation**: Syllable validation doesn't enforce that P is actually a consonant (not just "not a vowel").

### Medium Issues
6. **Import path inconsistency**: Mix of `['../utils/init']`, `['../utils/utils.pl']`, and `:- use_module(...)` syntax. Pick one style.
7. **`grapheme_segment.pl` is unmaintainable**: 73 lines of facts with inconsistent formatting (some with brackets, some without). Consider generating or refactoring.
8. **Abandoned code**: `utils/re.pl` is empty; `transcription.pl` has unresolved TODOs; many core predicates are untested.
9. **Test coverage is shallow**: Only `sonority/1` is tested. Missing tests for syllable construction, `split_syllable/4`, `find_nucleus/2`, and DCG rules.
10. **Sparse documentation**: Predicates lack mode declarations and docstrings explaining constraints and phonological principles.

### Minor Issues
- `dif3/3` unnecessarily duplicates `dif/2` logic; just call `dif/2` three times
- Inconsistent comment formatting and typos ("Fonctions" vs "Functions", missing spaces)
