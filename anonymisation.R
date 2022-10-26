data <- read_csv("data/all_data.csv")

passed <- read_csv("data/passed.csv")

passed_yes <- passed %>%
  filter(passed == TRUE)

just_passed <- inner_join(data, passed_yes, by = "participant")

final_data <- just_passed %>%
  group_by(participant) %>%
  mutate(ID = cur_group_id())

final_data$participant <- NULL

final_data <- final_data %>%
  rename(participant = ID)

write_csv(final_data, "data/final_data.csv")

# This script is generic and was used with both experiments. Be sure to rename
# your final_data.csv dataset with something more descriptive.