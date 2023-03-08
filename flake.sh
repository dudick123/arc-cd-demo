docker run --rm --name f8 --volume $(pwd):/src --workdir /src
python:3-alpine
sh -c "
pip install flake8==3.8.* flake8-json junit-xml;
flake8 --format json --output-file=flake8-testresults.json;
cat flake8-testresults.json;
python .pipelines/utils/flake8json2junitxml.py < flake8-testresults.json;
cat flake8-testresults.xml
"