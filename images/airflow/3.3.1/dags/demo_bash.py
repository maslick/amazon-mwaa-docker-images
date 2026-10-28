# pylint: disable=C0303,W0311
"""
    Demo DAG for executing bash operations on the Worker.
"""
from airflow.sdk.definitions.decorators import task, dag
from datetime import datetime


@dag(
    start_date=datetime(2025, 1, 1),
    schedule=None,
    catchup=False,
    tags=['demo'],
    params={
        "command": "python3 --version"
    }
)
def demo_bash():
    from airflow.providers.standard.operators.bash import BashOperator

    bash = BashOperator(
        task_id="bash_command",
        bash_command="{{ params.command }}"
    )

demo_bash()
