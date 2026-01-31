# SFBBO Sample Datasets for AI Data Analysis Workshop

This folder contains sample CSV datasets for use in the workshop exercises. All data is **simulated** for educational purposes and does not represent actual SFBBO survey results.

## Dataset Descriptions

### 1. `waterbird_survey_jan2025.csv`
**Use for:** Exercise 1 (Prompt Template), general EDA practice

A standard waterbird survey dataset with observations from multiple SFBBO monitoring sites during January 2025.

| Column | Description |
|--------|-------------|
| date | Survey date (YYYY-MM-DD) |
| location | SFBBO monitoring site name |
| species | Bird species common name |
| count | Number of individuals observed |
| weather | Weather conditions |
| observer | Observer initials/name |
| habitat | Habitat type |
| tide_level | Tide level during survey |

**💬 Type in Gemini after uploading:**
> "Summarize this waterbird survey data. What are the top 5 species by total count? Which locations have the highest bird diversity? Are there any patterns related to habitat or tide level?"

---

### 2. `shorebird_migration_winter2025.csv`
**Use for:** Exercise 5 (Shorebird Migration Analysis)

Weekly shorebird monitoring data with environmental variables for migration pattern analysis.

| Column | Description |
|--------|-------------|
| week | Week number of the year |
| year | Survey year |
| site | Monitoring site name |
| species | Shorebird species |
| count | Number observed |
| avg_temp_f | Average temperature (Fahrenheit) |
| precip_in | Precipitation (inches) |
| tide_height_ft | Tide height (feet) |
| moon_phase | Moon phase |

**💬 Type in Gemini after uploading:**
> "Analyze this shorebird migration data. How do counts change across weeks? Is there any correlation between bird counts and environmental factors like temperature, precipitation, or moon phase? Which site has the highest shorebird activity?"

---

### 3. `ridgways_rail_monitoring_2024.csv`
**Use for:** Exercise 7 (Structured Checklist)

Ridgway's Rail (Rallus obsoletus) survey data from SFBBO's long-term monitoring program.

| Column | Description |
|--------|-------------|
| survey_date | Date of survey |
| marsh_name | Marsh/wetland name |
| region | North Bay or South Bay |
| rails_detected | Number of rails detected |
| call_playback | Whether call playback was used |
| tide_level | Tide level |
| duration_min | Survey duration in minutes |
| observer | Observer name |
| temp_f | Temperature (Fahrenheit) |
| start_time | Survey start time |

**💬 Type in Gemini after uploading:**
> "Analyze this Ridgway's Rail monitoring data. Compare detection rates between North Bay and South Bay regions. Which marshes have the highest rail populations? Is there a pattern between detections and tide level or time of day? Create a summary table by marsh."

---

### 4. `monthly_comparison_2024_2025.csv`
**Use for:** Exercise 6 (Uncertainty Prompt), year-over-year comparisons

Monthly count comparisons between 2024 and 2025 with calculated percent change.

| Column | Description |
|--------|-------------|
| month | Month number |
| year | Current year |
| site | Monitoring site |
| species | Bird species |
| count | Current year count |
| previous_year_count | Previous year count |
| percent_change | Percent change from previous year |

**💬 Type in Gemini after uploading:**
> "Analyze this year-over-year comparison data. Which species show the biggest increases or decreases? Are the changes consistent across sites? Highlight any species with declines greater than 20% that may need conservation attention. Rate your confidence in each conclusion."

---

### 5. `species_by_habitat_summary.csv`
**Use for:** Exercise 4 (Visualization Guidance)

Aggregated summary of bird groups by site and habitat type.

| Column | Description |
|--------|-------------|
| site_name | Monitoring site name |
| habitat | Habitat type |
| total_shorebirds | Total shorebird count |
| total_waterfowl | Total waterfowl count |
| total_waders | Total wading bird count |
| survey_count | Number of surveys |
| avg_species_per_survey | Average species richness |

**💬 Type in Gemini after uploading:**
> "Create visualizations for this habitat summary data. Suggest 3 different chart types that would show: 1) Which sites have the most birds, 2) How bird groups are distributed across habitats, 3) Species diversity comparison. Explain what each chart would reveal."

---

### 6. `multiyear_population_trends.csv`
**Use for:** Long-term trend analysis, conservation discussions

Five-year population trends for key indicator species (2020-2024).

| Column | Description |
|--------|-------------|
| year | Survey year |
| species | Bird species |
| jan_count - may_count | Monthly counts |
| annual_avg | Annual average count |
| trend_vs_baseline | Percent change vs 2020 baseline |

**💬 Type in Gemini after uploading:**
> "Analyze these 5-year population trends. Which species are declining and which are stable or increasing? Calculate the average annual rate of change for each species. Which species should be prioritized for conservation action? Create a line chart showing trends over time."

---

### 7. `data_quality_exercise.csv`
**Use for:** Exercise 2 (Data Quality Check)

**Intentionally includes data quality issues** for practice identifying problems:
- Inconsistent capitalization (location, species names)
- Missing values
- Negative counts
- Outliers (unusually high counts)
- Wrong data in fields (date in count column)
- Inconsistent observer name formats

**💬 Type in Gemini after uploading:**
> "Review this dataset for data quality issues. Look for: missing values, inconsistent formatting, outliers, negative numbers, wrong data types, and any other problems. List each issue you find with the specific row and column, and suggest how to fix it."

---

## 📊 Visualization-Ready Datasets

These datasets are specifically designed to show clear patterns and trends that produce beautiful charts in Gemini:

### 8. `migration_timeline.csv`
**Best chart:** Line chart showing migration waves

Shows the classic bell-curve migration pattern for 3 shorebird species from Sept 2024 to April 2025. Perfect for demonstrating seasonal patterns with clear peak counts in winter.

**Ask Gemini:** "Create a line chart showing how bird counts change over the migration season for each species."

---

### 9. `10year_population_trends.csv`
**Best chart:** Multi-line trend chart

Ten years of population data (2015-2024) showing:
- 📉 **Declining:** Dunlin, Western Sandpiper, Snowy Egret
- 📈 **Increasing:** American Avocet, Forster's Tern

**Ask Gemini:** "Create a chart showing 10-year population trends. Which species are declining and which are increasing?"

---

### 10. `temperature_vs_shorebirds.csv`
**Best chart:** Scatter plot with trend line

Strong negative correlation between temperature and shorebird counts. As temperatures rise in spring, shorebirds migrate north.

**Ask Gemini:** "Create a scatter plot of temperature vs shorebird count and describe the correlation."

---

### 11. `tide_foraging_patterns.csv`
**Best chart:** Grouped bar chart or line chart

Shows how shorebird foraging activity varies by time of day at different tide levels:
- Low tide = peak foraging in morning
- High tide = more even distribution

**Ask Gemini:** "Create a chart comparing bird activity throughout the day at different tide levels."

---

### 12. `species_habitat_matrix.csv`
**Best chart:** Heatmap or stacked bar chart

15 species × 5 habitat types showing clear habitat preferences:
- Shorebirds prefer mudflats
- Waterfowl prefer freshwater
- Terns prefer open water

**Ask Gemini:** "Create a visualization showing which habitats each species prefers."

---

### 13. `habitat_distribution.csv`
**Best chart:** Stacked bar chart or pie charts

Bird counts by habitat type at 8 different sites. Shows how different sites specialize in different habitat types.

**Ask Gemini:** "Create a stacked bar chart showing habitat composition at each site."

---

### 14. `monthly_site_comparison.csv`
**Best chart:** Multi-line chart or heatmap

12 months of data across 5 sites showing parallel seasonal patterns with different magnitudes. Palo Alto Baylands consistently has highest counts.

**Ask Gemini:** "Create a chart comparing monthly bird counts across all sites. Which site has the most birds?"

---

### 15. `seasonal_patterns_by_group.csv`
**Best chart:** Area chart or faceted line chart

14 species organized by group (Shorebird, Waterfowl, Wader) showing distinct seasonal patterns:
- Shorebirds: Winter peak
- Waterfowl: Winter peak  
- Waders: Summer peak

**Ask Gemini:** "Create a visualization showing how seasonal patterns differ between shorebirds, waterfowl, and waders."

---

## How to Use These Files

1. **Download** the CSV file you want to analyze
2. **Upload** to Google Gemini (click + or paperclip icon)
3. **Copy** the appropriate prompt from the slides
4. **Analyze** and iterate on your prompts!

## Tips

- Start with smaller datasets before tackling larger ones
- Use the data quality exercise to practice identifying issues
- Try combining datasets for more complex analyses
- Remember: these are simulated data for learning purposes

---

*Created for the SFBBO AI for Data Analysis Workshop*
