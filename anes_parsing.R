anes <-read_dta("~/Desktop/methods_522/anes_timeseries_2012_dta/anes_timeseries_2012.dta")

anes_envir <- anes %>%
  select(contains("ENVIR"))%>%
  select(envir_drill:envir_gwhow)

anes_egal <- anes %>%
  select(contains("egal"))%>%
  select(egal_equal:egal_fewerprobs)

anes_effic <- anes %>%
  select(contains(("effic")), interest_attention)%>%
  select(effic_complicstd:effic_saystd, effic_complicrev:effic_sayrev, interest_attention)

anes_q <- anes %>%
  select(contains("ctrait_dpc"), presapp_job)


anes_full <- bind_cols(anes_envir, anes_egal, anes_effic, anes_q)

write.csv(anes_full,file="~/Desktop/methods_522/data/anes_2012.csv")
          