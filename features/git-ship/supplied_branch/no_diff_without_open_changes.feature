Feature: Git Ship: errors when the branch diff is empty without open changes

  Background:
    Given I have feature branches named "feature" and "other_feature"
    And the following commit exists in my repository
      | branch  | location | file name   | file content   |
      | main    | remote   | common_file | common content |
      | feature | local    | common_file | common content |
    And I am on the "other_feature" branch
    When I run `git ship feature` while allowing errors


  Scenario: result
    Then I get the error "The branch 'feature' has no shippable changes"
    And I am still on the "other_feature" branch
