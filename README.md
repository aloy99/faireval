# PIXIU (貔貅): A Large Language Model, Instruction Data and Evaluation Benchmark for Finance

This repository introduces PIXIU, an open-source resource featuring the first financial large language models (LLMs), instruction tuning data, and evaluation benchmarks to holistically assess financial LLMs. Our goal is to continually push forward the open-source development of financial artificial intelligence (AI). This project is developed by Qianqian Xie, Weiguang Han, Xiao Zhang, Yanzhao Lai, Min Peng, Alejandro Lopez-Lira, and Jimin Huang.

## Overview

The advancement of Natural Language Processing (NLP) and machine learning (ML) techniques in financial technology (FinTech) has enabled a diverse set of capabilities from predicting stock price movements to advanced financial analytics. However, to effectively understand the complex financial language and concepts, domain-specific LLMs are necessary.

Despite prior efforts, there is a lack of open-source financial LLMs and benchmarks to evaluate them. Additionally, these models are not fine-tuned to follow natural language instructions, limiting their performance in downstream financial tasks.

To address these gaps, we introduce PIXIU, providing:

1. Open-source LLMs tailored for finance called FinMA, by fine-tuning LLaMA with the dataset constructed in PIXIU.
2. Large-scale, high-quality multi-task and multi-modal financial instruction tuning data.
3. Holistic financial evaluation benchmarks FLUPE for assessing financial LLMs.

## Key Features

- **Open resources**: PIXIU openly provides the financial LLM, instruction tuning data, and datasets included in the evaluation benchmark to encourage open research and transparency.
  
- **Multi-task**: The instruction tuning data in PIXIU cover a diverse set of financial tasks, including four financial NLP tasks and two financial prediction tasks.

- **Multi-modality**: PIXIU's instruction tuning data consist of multi-modality financial data, including time series data from stock movement predictions and portfolio management tasks. It covers various types of financial texts, including reports, news articles, tweets, and regulatory filings.
  
- **Diversity**: Unlike previous benchmarks focusing mainly on financial NLP tasks, PIXIU's evaluation benchmark includes critical financial prediction tasks aligned with real-world scenarios, making it more challenging.

## Building PIXIU

To construct the multi-task and multi-modal instruction data, we collected publicly available training data from diverse tasks. We wrote task-specific instructions for each task and assembled these with data samples to create a large-scale instruction tuning data.

Using this dataset, we conducted multi-task instruction tuning on LLaMA to create FinMA, a domain-specific LLM.

We built the Financial Language Understanding and Prediction Evaluation Benchmark (FLUPE), covering 4 financial NLP tasks with 5 datasets, and 2 financial prediction tasks with 6 datasets under 2 different scenarios. This benchmark allows us to compare the performance of our model with BloombergGPT and general domain LLMs such as ChatGPT and GPT-4.

## Structure of Repository

The repository is organized as follows:

1. **Models**: Contains the FinMA model fine-tuned on our dataset.
2. **Instruction Tuning Data**: Multi-task and multi-modal instruction data for financial tasks.
3. **Evaluation Benchmark**: FLUPE for evaluating financial LLMs.

## FinMA v0.1: Financial Large Language Model

We are pleased to introduce the first version of FinMA, a specialized model fine-tuned on LLaMA 7B. 

FinMA v0.1 has been trained specifically on our financial NLP instruction dataset. This dataset is drawn from diverse and respected financial resources, ensuring that the model has a comprehensive understanding of financial language and scenarios. This version is particularly designed to enhance the performance on financial NLP tasks compared to the base LLaMa 7B model, BloombergGPT, ChatGPT and GPT-4.

FinMA v0.1 is now available on Huggingface for public use. We look forward to the valuable contributions that this initial version will make to the financial NLP field and encourage users to apply it to various financial tasks and scenarios. We also invite feedback and shared experiences to help improve future versions.

## Instruction Dataset

Our instruction dataset is uniquely tailored for the domain-specific LLM,FinMA. This dataset has been meticulously assembled to fine-tune our model on a diverse range of financial tasks. It features publicly available multi-task and multi-modal data derived from the same large-scale financial corpus used to evaluate BloombergGPT.

The dataset is multi-faceted, featuring tasks including sentiment analysis, news headline classification, named entity recognition, question answering, stock movement prediction, and portfolio management. It covers both textual and time-series data modalities, offering a rich variety of financial data. The task specific instruction prompts for each task have been carefully degined by one domain expert.

The table below summarizes the different tasks, their corresponding modalities, text types, and examples of the instructions used for each task:

| **Task** | **Modalities** | **Text Types** | **Instructions Examples** |
| --- | --- | --- | --- |
| Sentiment Analysis | Text | Reports, News Articles | "Identify the sentiment of the given report text." |
| News Headline Classification | Text | News Headlines | "Classify the financial topic of this news headline." |
| Named Entity Recognition | Text | Reports, Regulatory Filings | "Highlight the financial entities in this text." |
| Question Answering | Text | All Text Types | "Answer the following question based on the given text." |
| Stock Movement Prediction | Text, Time-Series | Reports, News, Stock Prices | "Predict the stock movement based on the given historical prices and news." |
| Portfolio Management | Text, Time-Series | Reports, News, Stock Prices | "Suggest a portfolio adjustment based on the given market information." |

The dataset contains a vast amount of instruction data samples for each task, allowing FinMA to capture the nuances of the diverse financial tasks. The table below provides the statistical details of the instruction dataset of NLP tasks:


| Task            | Data Source                | Example Number (Train) | Example Number (Test) | Original Paper                               |
|-----------------|----------------------------|------------------------|-----------------------|----------------------------------------------|
| Sentiment Analysis    | Financial Phrasebank (FPB)   | 3,876                  | 970                   | Malo et al., 2014                            |
| Aspect-specific Sentiment Analysis | FiQA Sentiment Analysis (FiQA SA) | 938                    | 235                   | Maia et al., 2018                            |
| Binary Classification   | Headline                   | 9,129                  | 2,283                 | Sinha and Khandait, 2020                     |
| Named Entity Recognition   | NER                        | 504                    | 98                    | Salinas Alvarado et al., 2015; Tjong Kim Sang and De Meulder, 2003 |
| Conversational Question Answering | ConvFinQA                  | 11,104                 | 1,490                 | Chen et al., 2022                            |


This dataset, along with the model and evaluation benchmark, is available in an open-source format to support future research in the financial AI sector. More details about the dataset and its usage can be found in the README in the "Instruction Tuning Data" directory.


Absolutely. Here is a refined version of the benchmark section with metrics and their explanations following the table:

## Benchmark

In this section, we provide a detailed performance analysis of Finma compared to other leading models, including ChatGPT, GPT-4, and BloombergGPT. For this analysis, we've chosen a range of tasks and metrics that span various aspects of financial Natural Language Processing. 

| Dataset    | Metric    | FinMA v0.1 | ChatGPT | GPT-4 | BloombergGPT |
|------------|-----------|-----------------|---------|-------|--------------|
| NER        | Entity F1 | 0.69            | 0.77    | **0.83**  | 0.61         |
| Headlines  | Avg F1    | **0.98**            | 0.76    | 0.86  | 0.82         |
| FPB        | ACC       | **0.87**            | 0.78    | 0.76  | -            |
| FPB        | F1        | **0.87**            | 0.78    | 0.78  | 0.51         |
| FIQASA     | ACC       | **0.84**            | -       | -     | -            |
| FIQASA     | F1        | **0.84**            | -       | -     | 0.75         |
| FinQA      | EM ACC    | 0.07            | 0.58    | **0.63**  | -            |
| ConvFinQA  | EM ACC    | 0.31            | 0.60    | **0.76**  | 0.43         |

The metrics used for evaluation are:

- **Entity F1 (NER):** This metric evaluates the quality of Named Entity Recognition by calculating the harmonic mean of precision and recall.
  
- **Avg F1 (Headlines):** This metric averages the F1 scores across different categories in the headlines task. 

- **ACC (FPB & FIQASA):** Accuracy (ACC) measures the fraction of predictions our model got right.

- **F1 (FPB & FIQASA):** F1 score is the harmonic mean of precision and recall. It is a good way to show that a classifier has a good value for both recall and precision.

- **EM ACC (FinQA & ConvFinQA):** Exact Match Accuracy (EM ACC) is the percentage of predictions that exactly match the true answer. 

Note that while Finma displays competitive performance in many of the tasks, it underperforms in tasks such as FinQA and ConvFinQA. This underperformance is attributable to the fact that the Llama 7B model, which Finma is based upon, has not been pre-trained on tasks involving mathematical reasoning. The ability to parse and respond to numerical inputs is critical for financial tasks and is a key area for potential improvement in future iterations of Finma.

In subsequent versions, we plan to address these limitations by incorporating larger backbone models such as Llama 13B or pre-training on tasks involving mathematical reasoning. We believe that this addition will significantly enhance Finma's performance on finance-specific tasks that require numerical understanding.


## Usage

Please refer to the individual README files in the respective directories for usage instructions for the models, datasets, and benchmark.

## Citation

If you use PIXIU in your work, please cite our paper.

```
(Bibtex format of the paper will go here)
```

## License

PIXIU is licensed under [LICENSE NAME]. For more details, please see the [LICENSE](LICENSE) file.

## Contributions

